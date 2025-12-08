import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../features/auth/data/models/request/social_model.dart';

@LazySingleton()
class AppleAccountLoginService {
  final FirebaseAuth firebaseAuth;

  AppleAccountLoginService({required this.firebaseAuth});

  Future<SocialModel> login() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
        webAuthenticationOptions: Platform.isIOS
            ? null
            : WebAuthenticationOptions(
                clientId: 'co.uk.jacksi.aslolapp-service',
                redirectUri: Uri.parse(
                  'https://aslolstore.com/api/callback/apple',
                ),
              ),
      );

      final AuthCredential appleAuthCredential = OAuthProvider('apple.com')
          .credential(
            idToken: appleCredential.identityToken,
            rawNonce: Platform.isIOS ? rawNonce : null,
            accessToken: appleCredential.authorizationCode,
          );
      final userCredential = await firebaseAuth.signInWithCredential(
        appleAuthCredential,
      );
      final user = userCredential.user;

      final String? nameFromApple = appleCredential.givenName != null
          ? '${appleCredential.givenName} ${appleCredential.familyName ?? ''}'
          : null;

      final String? emailFromApple = appleCredential.email;

      return SocialModel(
        uid: user?.uid,
        name: nameFromApple ?? user?.displayName,
        email: emailFromApple ?? user?.email,
        phone: user?.phoneNumber,
        publicName: nameFromApple ?? user?.displayName,
      );
    } catch (e) {
      rethrow;
    }
  }
}

String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

String generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(
    length,
    (_) => charset[random.nextInt(charset.length)],
  ).join();
}
