import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/data/trip/trip.dart';
import 'package:trip_planner/data/trip/trip_dao.dart';
import 'package:trip_planner/data/trip/trip_database_repository.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';

void main() {
  final tripDao = _TripDaoMock();

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
      when(tripDao.insertTrip(any)).thenAnswer((_) => Future.value());
      final classUnderTest = TripDatabaseRepository(tripDao);
      final startDate = DateTime(2020);
      final endDate = DateTime(startDate.year + 1);
      final trip =
          TripModel(name: "Trip", startDate: startDate, endDate: endDate);
      //when
      await classUnderTest.create(trip);
      //then
      expect(verify(tripDao.insertTrip(captureAny)).captured.single.startDateTime, startDate.microsecondsSinceEpoch);
    });

    test("creating new trip should correctly map startDate to microseconds",
            () async {
          //given
          when(tripDao.insertTrip(any)).thenAnswer((_) => Future.value());
          final classUnderTest = TripDatabaseRepository(tripDao);
          final startDate = DateTime(2020);
          final endDate = DateTime(startDate.year + 1);
          final trip =
          TripModel(name: "Trip", startDate: startDate, endDate: endDate);
          //when
          await classUnderTest.create(trip);
          //then
          expect(verify(tripDao.insertTrip(captureAny)).captured.single.endDateTime, endDate.microsecondsSinceEpoch);
        });
  });
}

class _TripDaoMock extends Mock implements TripDao {}
