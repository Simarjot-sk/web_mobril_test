import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_mobril_test/presentation/screens/home/widgets/home_bottom_bar.dart';
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
        _createItem(_leftAlignAnimation, "Real-estate", 'estate.svg'),
        _createItem(_rightAlignAnimation, "Add Goal", 'add.svg'),
        _createItem(_topAlignAnimation, "Healthcare", 'healthcare.svg'),
        _createItem(_bottomAlignAnimation, "Vacation", 'vacation.svg'),
      ],
    );
  }

  Widget _createItem(
      Animation<AlignmentGeometry> animation, String label, String iconPath) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width * 0.8,
      width: width * 0.8,
      child: AlignTransition(
        alignment: animation,
        child: _createInnerItem(label, iconPath),
      ),
    );
  }

  Widget _createInnerItem(String label, String iconPath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: buildShadowContainer(
            child: Center(
              child: SvgPicture.asset(
                'assets/$iconPath',
                width: 50,
                height: 50,
              ),
            ),
          ),
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
