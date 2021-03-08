
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_planner/presentation/pages/trip/trip_home_page.dart';

void main(){
  testWidgets('Trip Home page should have "Trip planner" title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: TripHomePage()));
    expect(find.text("Trip planner"), findsOneWidget);
  });
}