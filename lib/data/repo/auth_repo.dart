import 'package:google_sign_in/google_sign_in.dart';
import 'package:web_mobril_test/data/shared_pref_helper.dart';

class AuthRepo {
  static final _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future<bool> isSignedId() {
    return _googleSignIn.isSignedIn();
  }

  ///@return Null if user aborted the login dialog, and [GoogleSignInAccount] is login is successful
  static Future<GoogleSignInAccount?> loginWithGoogle() async {
    final account = await _googleSignIn.signIn();
    if (account != null) {
      //saving the user details locally
      Prefs.isLoggedIn.set(true);
      Prefs.userEmail.set(account.email);
      if (account.photoUrl != null) {
        Prefs.profileUrl.set(account.photoUrl!);
      }
      if (account.displayName != null) {
        Prefs.userName.set(account.displayName!);
      }
    }
    return account;
  }

  static Future<void> signOut() {
    return _googleSignIn.signOut();
  }
}
