
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/commands/delete/delete_trip.dart';
import 'package:trip_planner/domain/trip/commands/delete/delete_trip_handler_impl.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

import 'delete_trip_handler_impl_test.mocks.dart';



@GenerateMocks([TripRepository])
void main() {
  group("DeleteTripHandlerImpl deleteTrip()", () {
    test("should pass id properly", () async {
      //given
      final expectedId = 1;
      final tripRepository = MockTripRepository();
      final classUnderTest = DeleteTripHandlerImpl(tripRepository);

      //when
      await classUnderTest.deleteTrip(DeleteTrip( expectedId));

      //then
      final actualId = verify(tripRepository.deleteById(captureAny)).captured.single as int;
      expect(actualId,expectedId);
    });
  });
}
