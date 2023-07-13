import 'package:flutter/cupertino.dart';
import 'package:web_mobril_test/data/repo/auth_repo.dart';
import 'package:web_mobril_test/ui_state.dart' as state;
import 'dart:developer' as dev;

class LoginStateHolder extends ChangeNotifier {
  state.UiState? loginState;

  void loginWithGoogle() {
    try {
      _updateState(const state.Loading());
      AuthRepo.loginWithGoogle();
      _updateState(const state.Success(""));
    } catch (th, stack) {
      dev.log(
        "error while logging in with google",
        stackTrace: stack,
        error: th,
      );
      _updateState(const state.Failure("Something Went Wrong"));
    }
  }

  void _updateState(state.UiState newState) {
    loginState = newState;
    notifyListeners();
  }
}
