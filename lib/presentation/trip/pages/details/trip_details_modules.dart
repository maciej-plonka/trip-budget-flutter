import 'package:flutter/material.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';

class TripDetailsModules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseCard.straight(
      child: Container(width: double.infinity, height: 180.0),
    );
  }
}
