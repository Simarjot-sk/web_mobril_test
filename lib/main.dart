import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/repo/auth_repo.dart';
import 'package:web_mobril_test/data/shared_pref_helper.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  final isSignedIn = await AuthRepo.isSignedId();
  runApp(
    MyApp(
      isSignedIn: isSignedIn,
    ),
  );
}
