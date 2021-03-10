import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';
import 'package:trip_planner/presentation/trip/list/ui/trip_list_card.dart';

void main() {
  group("TripHomeCard", () {
    testWidgets("should show trip's name", (WidgetTester tester) async {
      final DateTime startDate = DateTime.now().add(Duration(days: 1));
      final DateTime endDate = startDate.add(Duration(days: 1));
      final TripModel trip = TripModel(
          name: "Trip name", startDate: startDate, endDate: endDate, id: 1);
      await tester.pumpWidget(MaterialApp(home: TripListCard(trip: trip)));
      expect(find.text(trip.name), findsOneWidget);
    });
    testWidgets('should show "Finished" if endDate is in the past',
        (WidgetTester tester) async {
      final DateTime endDate = DateTime.now().subtract(Duration(days: 1));
      final DateTime startDate = endDate.subtract(Duration(days: 1));
      final TripModel trip = TripModel(
          name: "Trip name", startDate: startDate, endDate: endDate, id: 1);
      await tester.pumpWidget(MaterialApp(home: TripListCard(trip: trip)));
      expect(find.text("Finished"), findsOneWidget);
    });

    testWidgets('should show "Already started" if startDate is in the past',
        (WidgetTester tester) async {
      final DateTime startDate = DateTime.now().subtract(Duration(days: 1));
      final DateTime endDate = DateTime.now().add(Duration(days: 1));
      final TripModel trip = TripModel(
          name: "Trip name", startDate: startDate, endDate: endDate, id: 1);
      await tester.pumpWidget(MaterialApp(home: TripListCard(trip: trip)));
      expect(find.text("Already started"), findsOneWidget);
    });

    testWidgets('should show "Starts tomorrow" if startDate is next day',
        (WidgetTester tester) async {
      final DateTime startDate =
          DateTime.now().add(Duration(days: 1, hours: 1));
      final DateTime endDate = startDate.add(Duration(days: 1));
      final TripModel trip = TripModel(
          name: "Trip name", startDate: startDate, endDate: endDate, id: 1);
      await tester.pumpWidget(MaterialApp(home: TripListCard(trip: trip)));
      expect(find.text("Starts tomorrow"), findsOneWidget);
    });
  });
}
