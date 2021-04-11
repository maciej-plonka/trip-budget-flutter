import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShoppingHomePageErrorContent extends StatelessWidget {
  final String error;

  const ShoppingHomePageErrorContent({Key? key, required this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
