import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/repo/auth_repo.dart';
import 'package:web_mobril_test/presentation/screens/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const route = "home_screen_route";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
          onPressed: () {
            AuthRepo.signOut();
            Navigator.pushReplacementNamed(context, LoginScreen.route);
          },
        ),
      ),
    );
  }
}
