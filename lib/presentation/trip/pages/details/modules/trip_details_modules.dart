import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trip_planner/presentation/router/app_router.gr.dart';
import 'package:trip_planner/presentation/trip/pages/details/modules/budget_module.dart';
import 'package:trip_planner/presentation/trip/pages/details/modules/shopping_module.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';

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
              BudgetModule(
                onClick: () {
                  context.router.root.push(BudgetRoute(tripId: tripId));
                },
              ),
              ShoppingModule(onClick: () {
                context.router.root.push(ShoppingRoute(tripId: tripId));
              }),
            ],
          )
        ]),
      ),
    );
  }
}
