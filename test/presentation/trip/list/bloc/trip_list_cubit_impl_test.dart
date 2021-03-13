import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';
import 'package:trip_planner/domain/trip/trip_service.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit_impl.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_state.dart';

void main() {
  group("TripListCubit", () {
    TripService tripService;
    setUpAll(() {
      tripService = _TripServiceMock();
    });

    blocTest(
      "should not return state after creation",
      build: () => TripListCubitImpl(tripService),
      expect: [],
    );

    blocTest(
      "should return two states when calling getAll() method",
      build: () {
        when(tripService.findAll()).thenAnswer((_) async => []);
        return TripListCubitImpl(tripService);
      },
      act: (TripListCubit cubit) => cubit.getAll(),
      expect: [isA<TripListLoading>(), isA<TripListLoaded>()],
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
      expect: [isA<TripListLoading>(), TripListLoaded(listOfTripModels)],
    );
  });
}

TripModel _createValidModel() => TripModel(
      id: 1,
      name: "Valid",
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 1)),
    );

class _TripServiceMock extends Mock implements TripService {}
