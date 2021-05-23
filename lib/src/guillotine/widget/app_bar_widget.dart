import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
    this.appBar,
    required this.animationAppBarOppacity,
    required this.animationGuillotine,
    required this.noBar,
    required this.barSize,
    required this.width,
    required this.height,
    required this.hideAppBar,
    required this.delta,
    required this.leftSide,
  }) : super(key: key);

  final Widget? appBar;
  final Animation<double> animationAppBarOppacity;
  final Animation<double> animationGuillotine;
  final bool noBar;
  final double barSize;
  final double width;
  final double height;
  final bool hideAppBar;
  final double delta;
  final bool leftSide;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !noBar,
      child: FadeTransition(
        opacity:
            hideAppBar ? animationAppBarOppacity : kAlwaysCompleteAnimation,
        child: Transform.rotate(
          angle: appBarRotateAngle,
          origin: Offset(0, barSize),
          alignment: leftSide ? Alignment.topLeft : Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: barSize),
            child: RotatedBox(
              quarterTurns: 1,
              child: SizedBox(
                width: height,
                height: barSize,
                child: FittedBox(
                  alignment: Alignment.topLeft,
                  child: RotatedBox(
                    quarterTurns: leftSide ? 0 : 2,
                    child: SizedBox(
                      width: width,
                      height: barSize,
                      child: SafeArea(
                        bottom: false,
                        child: Center(
                          child: appBar,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double get appBarRotateAngle =>
      hideAppBar ? animationGuillotine.value : delta / 2;
}
