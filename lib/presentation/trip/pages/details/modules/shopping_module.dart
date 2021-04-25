import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';
import 'package:trip_planner/presentation/trip/pages/details/modules/base_module.dart';


class ShoppingModule extends StatelessWidget {
  final void Function() onClick;

  const ShoppingModule({Key? key, required this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: BaseModule(
          gradient: LinearGradients.purple,
          size: 98,
          icon: const Icon(
            Icons.shopping_bag,
            color: Colors.white,
            size: 36.0,
          ),
          text: const Text(
            "Shopping List",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}
