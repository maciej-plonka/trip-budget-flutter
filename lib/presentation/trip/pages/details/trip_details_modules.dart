import 'package:flutter/material.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';
import "package:trip_planner/presentation/router/navigator_state_extensions.dart";
class TripDetailsModules extends StatelessWidget {
  final int tripId;

  const TripDetailsModules({Key? key, required this.tripId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseCard.straight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          const Center(
            child: Text("Modules"),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _budgetModule(context),
              _shoppingListModule(context)
            ],
          )
        ]),
      ),
    );
  }

  Widget _budgetModule(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushBudgetHome(tripId);
      },
      child: _TripDetailsSingleModule(
          gradient: LinearGradients.orange,
          size: 98,
          icon: const Icon(
            Icons.attach_money,
            color: Colors.white,
            size: 36.0,
          ),
          text: Text(
            "Budget",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _shoppingListModule(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushShoppingListHome(tripId);
      },
      child: _TripDetailsSingleModule(
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

class _TripDetailsSingleModule extends StatelessWidget {
  final LinearGradient gradient;
  final double size;
  final Icon icon;
  final Text text;

  const _TripDetailsSingleModule(
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
