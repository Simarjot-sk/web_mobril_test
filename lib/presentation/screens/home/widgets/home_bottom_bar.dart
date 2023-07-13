import 'package:flutter/material.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';
import 'package:web_mobril_test/utils/inner_shadow.dart';

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
    return SizedBox(
      height: 70,
      child: buildShadowContainer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      ),
    );
  }
}

Widget buildShadowContainer({required Widget child}) {
  return InnerShadow(
    blur: 12,
    color: kPrimaryColor,
    offset: const Offset(5, 5),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: kScreenBackgroundColor,
      ),
      child: child,
    ),
  );
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: isSelected ? 3 : 0,
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
