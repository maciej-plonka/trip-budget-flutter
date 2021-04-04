
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/commands/delete/trip_delete_command.dart';
import 'package:trip_planner/domain/trip/commands/delete/trip_delete_command_handler_impl.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

import 'trip_delete_command_handler_impl_test.mocks.dart';



@GenerateMocks([TripRepository])
void main() {
  group("DeleteTripHandlerImpl deleteTrip()", () {
    test("should pass id properly", () async {
      //given
      final expectedId = 1;
      final tripRepository = MockTripRepository();
      final classUnderTest = TripDeleteCommandHandlerImpl(tripRepository);

      //when
      await classUnderTest.deleteTrip(TripDeleteCommand( expectedId));

      //then
      final actualId = verify(tripRepository.deleteById(captureAny)).captured.single as int;
      expect(actualId,expectedId);
    });
  });
}
