import 'package:flutter/widgets.dart';
import 'package:trip_planner/presentation/router/route_generator.dart';

extension NavigatorStateExtensions on NavigatorState {
  Future<void> pushTripNew() => pushNamed(Routes.tripNew);

  Future<void> pushTripDetails(int tripId) =>
      pushNamed(Routes.tripDetails, arguments: tripId);

  Future<void> pushTripEdit(int tripId) => pushNamed(Routes.tripEdit,arguments:  tripId);

  Future<void> pushBudgetHome(int tripId) => pushNamed(Routes.budgetHome, arguments: tripId);
  Future<void> pushShoppingListHome(int tripId) => pushNamed(Routes.shoppingListHome, arguments: tripId);
}
