import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/trip_service.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_state.dart';

void main() {
  group("TripListCubit", () {
    TripService tripService;
    setUpAll(() {
      tripService = _TripServiceMock();
    });

    test("should return states in order", () async {
      //given
      when(tripService.findAll()).thenAnswer((_) => Future.value([]));
      final classUnderTest = TripListCubit(tripService);
      //then
      expectLater(classUnderTest, emitsInOrder(
          [
            isA<TripListLoading>(),
            isA<TripListLoaded>()
          ]
      ));
      classUnderTest.getAll();
    });
  });
}


class _TripServiceMock extends Mock implements TripService {}