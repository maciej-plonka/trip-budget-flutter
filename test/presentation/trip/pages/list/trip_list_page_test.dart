import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/trip/query/trip_query_service.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_cubit_impl.dart';
import 'package:trip_planner/presentation/trip/pages/list/trip_list_page.dart';

import './trip_list_page_test.mocks.dart';


@GenerateMocks([TripQueryService])
void main(){
  final mockTripQueryService = MockTripQueryService();
  setUp(() {
    reset(mockTripQueryService);
    dependencies.registerSingleton<TripListCubit>(TripListCubitImpl(mockTripQueryService));
  });

  tearDown(() async{
    await dependencies.reset();
  });


  testWidgets('Trip Home page should have "Trip planner" title', (WidgetTester tester) async {
    List<TripModel> trips = [];
    when(mockTripQueryService.findAll()).thenAnswer((_) async => trips);
    await tester.pumpWidget(MaterialApp(home:  TripListPage()));
    expect(find.text("Trip planner"), findsOneWidget);
  });
}
