import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/query/trip_query_service_impl.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

import 'trip_query_service_impl_test.mocks.dart';


@GenerateMocks([TripRepository])
void main() {
  TripRepository repository = MockTripRepository();

  group("TripService findAll()", () {
    test("should return empty list when repository returns empty list",
        () async {
      //given
      when(repository.findAll()).thenAnswer((_) async => []);
      final classUnderTest = TripQueryServiceImpl(repository);
      //when
      final result = await classUnderTest.findAll();
      expect(result, []);
    });

    test("should return same trips as repository", () async {
      //given
      final list = [_createValidTripModel()];
      when(repository.findAll()).thenAnswer((_) async => list);
      final classUnderTest = TripQueryServiceImpl(repository);
      //when
      final result = await classUnderTest.findAll();
      expect(result, list);
    });
  });
}

TripModel _createValidTripModel () =>TripModel(
    id: 1,
    name: "Valid",
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(hours: 1)));
