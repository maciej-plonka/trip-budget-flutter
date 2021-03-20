import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const BaseCard({Key? key, required this.child, required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: const [
            const BoxShadow(color: Color(0x11000000), blurRadius: 5)
          ]),
      child: child,
    );
  }

  static BaseCard rounded({required Widget child}) {
    return BaseCard(child: child, borderRadius: 8.0);
  }

  static BaseCard straight({required Widget child}) {
    return BaseCard(child: child, borderRadius: 0.0);
  }
}
