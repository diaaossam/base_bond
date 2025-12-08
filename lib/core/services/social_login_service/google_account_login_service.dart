import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:bond/config/environment/environment_helper.dart' as env;
import '../../../features/auth/data/models/request/social_model.dart';

@LazySingleton()
class GoogleAccountLoginService {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  GoogleAccountLoginService({
    required this.googleSignIn,
    required this.firebaseAuth,
  });

  Future<void> _ensureInitialized() async {
    final serverClientId = env.Environment.googleServerClientId;
    await googleSignIn.initialize(serverClientId: serverClientId);
  }

  Future<SocialModel> login() async {
    await _ensureInitialized();
    final GoogleSignInAccount googleSignInAccount;
    try {
      googleSignInAccount = await googleSignIn.authenticate(
        scopeHint: ['email'],
      );
    } on GoogleSignInException catch (e) {
      throw Exception(
        'Google Sign-In failed: ${e.code.name} - ${e.description}',
      );
    }
    final GoogleSignInAuthentication googleSignInAuthentication =
        googleSignInAccount.authentication;
    final auth = await googleSignIn.authorizationClient.authorizationForScopes([
      'email',
    ]);

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: auth?.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await firebaseAuth.signInWithCredential(
      credential,
    );
    final User? user = authResult.user;

    SocialModel socialModel = SocialModel(
      uid: user?.uid,
      name: user?.displayName,
      email: user?.email,
      phone: user?.phoneNumber,
      publicName: user?.displayName,
    );

    return socialModel;
  }

  Future<void> logout() async {
    await googleSignIn.disconnect();
    await firebaseAuth.signOut();
  }
}
