import 'package:flutter/material.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';

class OptionsGroup extends StatefulWidget {
  const OptionsGroup({Key? key, required this.controller}) : super(key: key);

  final AnimationController controller;

  @override
  State<OptionsGroup> createState() => _OptionsGroupState();
}

class _OptionsGroupState extends State<OptionsGroup>
    with SingleTickerProviderStateMixin {
  late final Animation<AlignmentGeometry> _leftAlignAnimation;
  late final Animation<AlignmentGeometry> _rightAlignAnimation;
  late final Animation<AlignmentGeometry> _topAlignAnimation;
  late final Animation<AlignmentGeometry> _bottomAlignAnimation;

  @override
  void initState() {
    super.initState();
    _leftAlignAnimation = _createAlignmentAnimation(Alignment.centerLeft);
    _rightAlignAnimation = _createAlignmentAnimation(Alignment.centerRight);
    _topAlignAnimation = _createAlignmentAnimation(Alignment.topCenter);
    _bottomAlignAnimation = _createAlignmentAnimation(Alignment.bottomCenter);
  }

  Animation<AlignmentGeometry> _createAlignmentAnimation(
    Alignment endAlignment,
  ) {
    return Tween<AlignmentGeometry>(
      begin: Alignment.center,
      end: endAlignment,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _createItem(_leftAlignAnimation, "Real-estate", Icons.account_balance),
        _createItem(_rightAlignAnimation, "Add Goal", Icons.library_add),
        _createItem(_topAlignAnimation, "Healthcare", Icons.local_hospital),
        _createItem(_bottomAlignAnimation, "Vacation", Icons.accessibility_new),
      ],
    );
  }

  Widget _createItem(
      Animation<AlignmentGeometry> animation, String label, IconData iconData) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width * 0.8,
      width: width * 0.8,
      child: AlignTransition(
        alignment: animation,
        child: _createInnerItem(label, iconData),
      ),
    );
  }

  Widget _createInnerItem(String label, IconData iconData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white, width: 4)),
          child: Icon(iconData),
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
