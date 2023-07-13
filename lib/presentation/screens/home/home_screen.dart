import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/repo/auth_repo.dart';
import 'package:web_mobril_test/presentation/screens/home/widgets/home_bottom_bar.dart';
import 'package:web_mobril_test/presentation/screens/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const route = "home_screen_route";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: HomeBottomBar(
          onItemSelected: (index) {},
        ),
      ),
      body: Center(child: _buildSignOutButton(context)),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return ElevatedButton(
      child: const Text("SignOut"),
      onPressed: () {
        AuthRepo.signOut();
        Navigator.pushReplacementNamed(context, LoginScreen.route);
      },
    );
  }
}
