import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:web_mobril_test/data/repo/auth_repo.dart';
import 'package:web_mobril_test/ui_state.dart';
import 'dart:developer' as dev;

class LoginStateHolder extends ChangeNotifier {
  UiState<GoogleSignInAccount>? loginState;

  void loginWithGoogle() async {
    try {
      _updateState(const Loading());
      final res = await AuthRepo.loginWithGoogle();
      if (res == null) {
        _updateState(const Failure("Login Aborted"));
      } else {
        _updateState(Success(res));
      }
    } catch (th, stack) {
      dev.log(
        "error while logging in with google",
        stackTrace: stack,
        error: th,
      );
      _updateState(
        const Failure("Something Went Wrong"),
      );
    }
  }

  void _updateState(UiState<GoogleSignInAccount> newState) {
    loginState = newState;
    notifyListeners();
  }
}
