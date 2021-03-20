import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/query/trip_query_service.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_cubit_impl.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_state.dart';

import './trip_list_cubit_impl_test.mocks.dart';

@GenerateMocks([TripQueryService])
void main() {
  group("TripListCubit", () {
    TripQueryService tripService = MockTripQueryService();

    setUp(() => reset(tripService));

    blocTest(
      "should not return state after creation",
      build: () => TripListCubitImpl(tripService),
      expect:() =>  [],
    );

    blocTest(
      "should return two states when calling getAll() method",
      build: () {
        when(tripService.findAll()).thenAnswer((_) async => []);
        return TripListCubitImpl(tripService);
      },
      act: (TripListCubit cubit) => cubit.getAll(),
      expect:() => [isA<TripListLoading>(), isA<TripListLoaded>()],
    );

    final listOfTripModels = [_createValidModel()];
    blocTest(
      "should return state with a list returned from service when calling getAll() method",
      build: () {
        when(tripService.findAll())
            .thenAnswer((_) async => listOfTripModels);
        return TripListCubitImpl(tripService);
      },
      act: (TripListCubit cubit) => cubit.getAll(),
      expect:() => [isA<TripListLoading>(), TripListLoaded(listOfTripModels)],
    );
  });
}

TripModel _createValidModel() => TripModel(
      id: 1,
      name: "Valid",
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 1)),
    );

