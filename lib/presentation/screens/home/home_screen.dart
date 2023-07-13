import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/repo/auth_repo.dart';
import 'package:web_mobril_test/presentation/screens/bottom_bar_screens/options_screen.dart';
import 'package:web_mobril_test/presentation/screens/home/widgets/home_bottom_bar.dart';
import 'package:web_mobril_test/presentation/screens/login/login_screen.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  static const route = "home_screen_route";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScreenBackgroundColor,
      body: Stack(
        children: [
          if (_bottomBarIndex == 1) const SecondScreen(),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: HomeBottomBar(
                onItemSelected: (index) {
                  setState(() {
                    _bottomBarIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
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
