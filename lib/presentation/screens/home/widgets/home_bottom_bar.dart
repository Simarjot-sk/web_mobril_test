import 'package:flutter/material.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key, required this.onItemSelected});

  final ValueChanged<int> onItemSelected;

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _buildShadowContainer(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icons.home_rounded,
              Icons.photo_library_rounded,
              Icons.stacked_bar_chart_rounded,
              Icons.person_rounded
            ].asMap().entries.map((e) {
              final index = e.key;
              final iconData = e.value;
              return BottomBarItem(
                  isSelected: index == selectedIndex,
                  iconData: iconData,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onItemSelected(index);
                  });
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildShadowContainer({required Widget child}) {
    var radius = BorderRadius.circular(50);
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor, width: 2),
        color: kPrimaryColor,
        borderRadius: radius,
      ),
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: kScreenBackgroundColor,
          borderRadius: radius,
          boxShadow: const [
            BoxShadow(
              color: kScreenBackgroundColor,
              blurRadius: 15,
              spreadRadius: 15,
            )
          ],
        ),
        child: child,
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.isSelected,
    required this.iconData,
    required this.onTap,
  });

  final bool isSelected;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = isSelected ? kPrimaryColor : Colors.white;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: isSelected ? 4 : 0,
              width: 45,
              decoration: BoxDecoration(
                  color: kPrimaryColor, borderRadius: BorderRadius.circular(5)),
            ),
            Icon(
              iconData,
              color: iconColor,
              size: 37,
            )
          ],
        ),
      ),
    );
  }
}
