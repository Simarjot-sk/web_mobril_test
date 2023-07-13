import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/shared_pref_helper.dart';
import 'package:web_mobril_test/presentation/screens/bottom_bar_screens/account_list_item.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProfileImage(),
            const AccountListItem(title: 'User Profile'),
            const AccountListItem(title: 'Change Password'),
            const AccountListItem(title: 'My Goals'),
            const AccountListItem(title: 'Subscription Plans'),
            const AccountListItem(title: 'Terms and Conditions'),
            const AccountListItem(title: 'Help Center'),
            const AccountListItem(title: 'Logout'),
            const AccountListItem(title: 'Delete Account'),
          ],
        ),
      ),
    );
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
        child: url == null ? const Icon(Icons.person, size: 50,) : Image.network(url),
      ),
    );
  }
}
