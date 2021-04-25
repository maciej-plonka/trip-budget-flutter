import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trip_planner/presentation/trip_id.dart';

class BudgetPage extends StatelessWidget {
  final int tripId;

  const BudgetPage({Key? key, @pathParam required this.tripId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TripId>.value(value: TripId(tripId), child: AutoRouter());
  }
}

