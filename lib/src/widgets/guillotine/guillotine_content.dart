import 'package:flutter/material.dart';

class GuillotineContent extends StatelessWidget {
  const GuillotineContent({
    Key? key,
    required this.drawerContent,
    required this.animationGuillotine,
    required this.animationContentOppacity,
    required this.barSize,
    required this.hideAppBar,
    required this.topAligment,
    required this.backgroundColor,
  }) : super(key: key);

  final Widget drawerContent;
  final Animation<double> animationGuillotine;
  final Animation<double> animationContentOppacity;
  final double barSize;
  final bool hideAppBar;
  final Color backgroundColor;
  final Alignment topAligment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: animationGuillotine.value,
      origin: Offset(0, barSize),
      alignment: topAligment,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.only(
            top: hideAppBar ? 0.0 : barSize,
          ),
          child: ColoredBox(
            color: backgroundColor,
            child: FadeTransition(
              opacity: animationContentOppacity,
              child: drawerContent,
            ),
          ),
        ),
      ),
    );
  }
}