import 'package:flutter/material.dart';
import 'package:trip_planner/presentation/trip/trip_page_scaffold.dart';

class TripEditPage extends StatelessWidget {
  final int tripId;

  const TripEditPage({Key? key, required this.tripId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TripPageScaffold(
      titleText: "Update trip",
      body: Container(),
    );
  }
}
