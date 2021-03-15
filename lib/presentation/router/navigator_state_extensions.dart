import 'package:flutter/widgets.dart';
import 'package:trip_planner/presentation/router/route_generator.dart';

extension NavigatorStateExtensions on NavigatorState {
  Future<void> pushTripNew() => pushNamed(Routes.tripNew);
}