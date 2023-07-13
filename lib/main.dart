import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/repo/auth_repo.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isSignedIn = await AuthRepo.isSignedId();
  runApp(
    MyApp(
      isSignedIn: isSignedIn,
    ),
  );
}
