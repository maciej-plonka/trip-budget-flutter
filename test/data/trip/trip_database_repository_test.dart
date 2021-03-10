import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/data/trip/trip_dao.dart';
import 'package:trip_planner/data/trip/trip_database_repository.dart';

void main() {
  TripDao tripDao;

  setUpAll(() {
    tripDao = _TripDaoMock();
  });

  group("TripDatabaseRepository findAll()", () {
    test("return empty list when there is no trip", () async {
      //given
      when(tripDao.findAll()).thenAnswer((_) => Future.value([]));
      final classUnderTest = TripDatabaseRepository(tripDao);
      //when
      final result = await classUnderTest.findAll();
      //then
      expect(result, []);
    });
  });
}

class _TripDaoMock extends Mock implements TripDao {}
