
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/commands/update/trip_update_command.dart';
import 'package:trip_planner/domain/trip/commands/update/trip_update_command_handler_impl.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

import 'trip_update_command_handler_impl_test.mocks.dart';


@GenerateMocks([TripRepository])
void main() {
  group("UpdateTripHandlerImpl updateTrip()", () {
    test("should pass id properly", () async {
      //given
      final expectedId = 1;
      final tripRepository = MockTripRepository();
      final classUnderTest = TripUpdateCommandHandlerImpl(tripRepository);

      //when
      await classUnderTest.updateTrip(_updateTrip(id: expectedId));

      //then
      final actualId = verify(tripRepository.update(captureAny)).captured.single.id as int;
      expect(actualId,expectedId);
    });

    test("should pass name properly", () async {
      //given
      final expected = "Name";
      final tripRepository = MockTripRepository();
      final classUnderTest = TripUpdateCommandHandlerImpl(tripRepository);

      //when
      await classUnderTest.updateTrip(_updateTrip(name: expected));

      //then
      final actual = verify(tripRepository.update(captureAny)).captured.single.name as String;
      expect(actual,expected);
    });

    test("should pass dates properly", () async {
      //given
      final expectedStartDate = DateTime(2020);
      final expectedEndDate = DateTime(2021);
      final tripRepository = MockTripRepository();
      final classUnderTest = TripUpdateCommandHandlerImpl(tripRepository);

      //when
      await classUnderTest.updateTrip(_updateTrip(startDate: expectedStartDate, endDate: expectedEndDate));

      //then
      final captured = verify(tripRepository.update(captureAny)).captured.single;
      final actualStartDate = captured.startDate as DateTime;
      final actualEndDate = captured.endDate as DateTime;
      expect(actualStartDate,expectedStartDate);
      expect(actualEndDate,expectedEndDate);
    });
  });
}
TripUpdateCommand _updateTrip({
  int id = 1,
  String name = "validName",
  DateTime? startDate,
  DateTime? endDate
}) {
  final finalStartDate = startDate ?? DateTime(2020);
  final finalEndDate = endDate ?? DateTime(finalStartDate.year + 1);
  return TripUpdateCommand(id: id, name: name, startDate: finalStartDate, endDate: finalEndDate);
}