import 'package:flutter/material.dart';
import 'package:web_mobril_test/presentation/screens/bottom_bar_screens/options_group.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _controller.forward();

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: kScreenBackgroundColor,
      height: size.height,
      width: size.width,
      child: AlignTransition(
        alignment: _alignAnimation,
        child: OptionsGroup(controller: _controller,),
      ),
    );
  }
}

