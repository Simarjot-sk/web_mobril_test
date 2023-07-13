import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  static void loginWithGoogle() {
    final googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    googleSignIn.signIn();
  }
}
