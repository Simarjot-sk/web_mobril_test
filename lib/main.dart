import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/shared_pref_helper.dart';
import 'my_app.dart';

void main() {
  Prefs.init();
  runApp(const MyApp());
}
