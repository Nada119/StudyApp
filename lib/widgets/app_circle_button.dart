import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton(
      {super.key,
      required this.child,
      this.color,
      this.onTap,
      this.width = 60});
  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type:
          MaterialType.transparency, //to remove white background around button
      clipBehavior: Clip.hardEdge, //bt3ml eh ?
      shape: const CircleBorder(),
      child: InkWell(
        child: child,
      ),
    );
  }
}
