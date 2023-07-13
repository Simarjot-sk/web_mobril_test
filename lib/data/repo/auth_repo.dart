import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  static final _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future<bool> isSignedId() {
    return _googleSignIn.isSignedIn();
  }

  ///@return Null if user aborted the login dialog, and [GoogleSignInAccount] is login is successful
  static Future<GoogleSignInAccount?> loginWithGoogle() async {
    return _googleSignIn.signIn();
  }

  static Future<void> signOut() {
    return _googleSignIn.signOut();
  }
}
