import 'package:flutter/material.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kPrimaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Do you want to Logout?',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1.0, color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FilledButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(color: kPrimaryColor),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                      foregroundColor:
                          MaterialStateProperty.all(kPrimaryColor)),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("Yes"))
            ],
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
