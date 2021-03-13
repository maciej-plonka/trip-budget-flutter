
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/trip/trip_service.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/list/ui/trip_list_page.dart';

void main(){
  TripListCubit tripListCubit;

  setUpAll(() async {
    tripListCubit = _TripListCubitMock();
    await dependencies.reset();
    dependencies.registerFactory<TripListCubit>(() => tripListCubit);
  });


  testWidgets('Trip Home page should have "Trip planner" title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:  TripListPage()));
    expect(find.text("Trip planner"), findsOneWidget);
  });
}

class _TripListCubitMock extends Mock implements TripListCubit {

}