import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/repo/auth_repo.dart';
import 'package:web_mobril_test/data/shared_pref_helper.dart';
import 'package:web_mobril_test/presentation/screens/bottom_bar_screens/account_list_item.dart';
import 'package:web_mobril_test/presentation/screens/bottom_bar_screens/logout_dialog.dart';
import 'package:web_mobril_test/presentation/screens/login/login_screen.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Account",
          style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileImage(),
              Text(Prefs.userName.getSafe() ?? "User"),
              Text(Prefs.userEmail.getSafe() ?? ""),
              const AccountListItem(
                  iconData: Icons.person, title: 'User Profile'),
              const AccountListItem(
                  iconData: Icons.password, title: 'Change Password'),
              const AccountListItem(
                  iconData: Icons.group_add, title: 'My Goals'),
              const AccountListItem(
                  iconData: Icons.money, title: 'Subscription Plans'),
              const AccountListItem(
                  iconData: Icons.book, title: 'Terms and Conditions'),
              const AccountListItem(iconData: Icons.help, title: 'Help Center'),
              AccountListItem(
                iconData: Icons.logout,
                title: 'Logout',
                onClick: () {
                  _onLogoutClicked(context);
                },
              ),
              const AccountListItem(
                  iconData: Icons.delete, title: 'Delete Account'),
              const SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }

  void _onLogoutClicked(BuildContext context) async {
    final shouldLogout = await showDialog(
        context: context, builder: (context) => const LogoutDialog());
    if (shouldLogout == true) {
      AuthRepo.signOut();
      Navigator.pushReplacementNamed(context, LoginScreen.route);
    }
  }

  Widget _buildProfileImage() {
    final url = Prefs.profileUrl.getSafe();
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: kPrimaryColor, width: 2)),
      child: ClipRRect(
        child: url == null
            ? const Icon(
                Icons.person,
                size: 50,
              )
            : Image.network(url),
      ),
    );
  }
}
