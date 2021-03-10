import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';
import 'package:trip_planner/domain/trip/trip_repository.dart';
import 'package:trip_planner/domain/trip/trip_service_impl.dart';

void main() {
  TripRepository repository;

  setUpAll(() {
    repository = _TripRepositoryMock();
  });

  group("TripService findAll()", () {
    test("should return empty list when repository returns empty list",
        () async {
      //given
      when(repository.findAll()).thenAnswer((_) => Future.value([]));
      final classUnderTest = TripServiceImpl(repository);
      //when
      final result = await classUnderTest.findAll();
      expect(result, []);
    });

    test("should return same trips as repository", () async {
      //given
      final list = [_createValidTripModel()];
      when(repository.findAll()).thenAnswer((_) => Future.value(list));
      final classUnderTest = TripServiceImpl(repository);
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

class _TripRepositoryMock extends Mock implements TripRepository {}
