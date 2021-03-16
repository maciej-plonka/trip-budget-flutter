import 'dart:math';

import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Gradient gradient;
  final BoxShape boxShape;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final double width;
  final double height;

  const GradientButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    @required this.gradient,
    this.boxShape,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
  })  : assert(onPressed != null),
        assert(child != null),
        assert(gradient != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: min(230, width ?? 230),
        height: min(41, height ?? 41),
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(32.0)),
          shape: boxShape ?? BoxShape.rectangle,
          gradient: gradient,
        ),
        child: child,
      ),
    );
  }
}
