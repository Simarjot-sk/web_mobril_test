import 'package:flutter/material.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';

class AccountListItem extends StatelessWidget {
  const AccountListItem(
      {super.key, required this.title, this.onClick, required this.iconData});

  final String title;
  final VoidCallback? onClick;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(10),
          color: kScreenBackgroundColor,
          boxShadow: [
            BoxShadow(
                color: kPrimaryColor.withAlpha(110),
                blurRadius: 5,
                offset: const Offset(0, 5))
          ],
        ),
        child: Row(
          children: [
            Icon(iconData),
            const SizedBox(width: 10),
            Text(title)
          ],
        ),
      ),
    );
  }
}
