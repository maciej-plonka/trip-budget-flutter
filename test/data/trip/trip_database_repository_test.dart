import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/data/trip/trip_dao.dart';
import 'package:trip_planner/data/trip/trip_database_repository.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';

import 'trip_database_repository_test.mocks.dart';

@GenerateMocks([TripDao])
void main() {
  final tripDao = MockTripDao();

  setUp(() => reset(tripDao));
  group("TripDatabaseRepository findAll()", () {
    test("return empty list when there is no trip", () async {
      //given
      when(tripDao.findAll()).thenAnswer((_) async => []);
      final classUnderTest = TripDatabaseRepository(tripDao);
      //when
      final result = await classUnderTest.findAll();
      //then
      expect(result, []);
    });
  });

  group("TripDatabaseRepository create()", () {
    test("creating new trip should correctly map startDate to microseconds",
        () async {
      //given
      final classUnderTest = TripDatabaseRepository(tripDao);
      final startDate = DateTime(2020);
      final endDate = DateTime(startDate.year + 1);
      final trip =
          TripModel(name: "Trip", startDate: startDate, endDate: endDate);
      //when
      await classUnderTest.create(trip);
      //then
      expect(verify(tripDao.create(captureAny)).captured.single.startDateTime,
          startDate.microsecondsSinceEpoch);
    });

    test("creating new trip should correctly map startDate to microseconds",
        () async {
      //given
      final classUnderTest = TripDatabaseRepository(tripDao);
      final startDate = DateTime(2020);
      final endDate = DateTime(startDate.year + 1);
      final trip =
          TripModel(name: "Trip", startDate: startDate, endDate: endDate);
      //when
      await classUnderTest.create(trip);
      //then
      expect(verify(tripDao.create(captureAny)).captured.single.endDateTime,
          endDate.microsecondsSinceEpoch);
    });
  });

  group("TripDatabaseRepository update()", () {
    test("trying to update TripModel with null id should throw exception",
        () async {
      //given
      final classUnderTest = TripDatabaseRepository(tripDao);
      final startDate = DateTime(2020);
      final endDate = DateTime(startDate.year + 1);
      final trip =
          TripModel(name: "Trip", startDate: startDate, endDate: endDate);
      //when
      final action = () async => await classUnderTest.update(trip);
      //then
      expect(action, throwsA(isA<Error>()));
    });

    test("updating trip should correctly map startDate to microseconds",
            () async {
          //given
          final classUnderTest = TripDatabaseRepository(tripDao);
          final startDate = DateTime(2020);
          final endDate = DateTime(startDate.year + 1);
          final trip =
          TripModel(id: 1,name: "Trip", startDate: startDate, endDate: endDate);
          //when
          await classUnderTest.update(trip);
          //then
          expect(verify(tripDao.update(captureAny)).captured.single.startDateTime,
              startDate.microsecondsSinceEpoch);
        });

    test("updating trip should correctly map startDate to microseconds",
        () async {
      //given
      final classUnderTest = TripDatabaseRepository(tripDao);
      final startDate = DateTime(2020);
      final endDate = DateTime(startDate.year + 1);
      final trip =
          TripModel(id: 1, name: "Trip", startDate: startDate, endDate: endDate);
      //when
      await classUnderTest.update(trip);
      //then
      expect(verify(tripDao.update(captureAny)).captured.single.endDateTime,
          endDate.microsecondsSinceEpoch);
    });
  });
}
