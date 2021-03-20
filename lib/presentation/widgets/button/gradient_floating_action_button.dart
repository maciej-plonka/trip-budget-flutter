import 'package:flutter/material.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';

class GradientFloatingActionButton extends FloatingActionButton {
  GradientFloatingActionButton({
    Key? key,
    Widget? child,
    required VoidCallback onPressed,
    required Gradient gradient,
  })
      : super(
          key: key,
          onPressed: onPressed,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: gradient
            ),
            child: child,
          ));

  static GradientFloatingActionButton primary(
      {required VoidCallback onPressed}) {
    return GradientFloatingActionButton(
      onPressed: onPressed,
      gradient: LinearGradients.primary,
      child: const Icon(Icons.add, size: 48.0),
    );
  }
}
