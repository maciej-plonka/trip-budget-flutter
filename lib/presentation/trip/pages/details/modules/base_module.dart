import 'package:flutter/widgets.dart';

class BaseModule extends StatelessWidget {
  final LinearGradient gradient;
  final double size;
  final Icon icon;
  final Text text;

  const BaseModule(
      {Key? key,
        required this.gradient,
        required this.size,
        required this.icon,
        required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [icon, const SizedBox(height: 8), text],
        ),
      ),
    );
  }
}