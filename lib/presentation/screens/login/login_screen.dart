import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const route = "login_screen_route";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: _buildLoginButton(),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _performGoogleSignIn,
      child: const Text("Login With Google"),
    );
  }

  void _performGoogleSignIn() {

  }
}
