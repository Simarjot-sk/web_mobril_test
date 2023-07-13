import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/photo_dto.dart';
import 'package:web_mobril_test/data/repo/photos_repo.dart';
import 'package:web_mobril_test/ui_state.dart';
import 'dart:developer' as dev;

class PhotosStateHolder extends ChangeNotifier {
  UiState<List<PhotoDto>> loadPhotoState = const Loading();

  Future<void> loadPhotos() async {
    try {
      _updateState(const Loading());
      final res = await PhotosRepo.getPhotoList();
      _updateState(Success(res));
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

  void _updateState(UiState<List<PhotoDto>> newState) {
    loadPhotoState = newState;
    notifyListeners();
  }
}
