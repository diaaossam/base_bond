import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import '../../../features/auth/data/models/request/social_model.dart';

@LazySingleton()
class GoogleAccountLoginService {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  GoogleAccountLoginService();

  Future<SocialModel> login() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn
        .signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
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
}
