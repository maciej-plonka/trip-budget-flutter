import 'package:flutter/material.dart';
import 'package:trip_planner/presentation/pages/trip/trip_home_card.dart';

class TripHomePage extends StatelessWidget {
  final Trip _trip = Trip(
      name: "Trip test",
      startDate: DateTime.now().add(Duration(days: 1)),
      endDate: DateTime.now().add(Duration(days: 2)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trip planner",
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [TripHomeCard(trip: _trip)],
        ),
      ),
    );
  }
}
