import 'package:trip_planner/domain/trip/commands/delete/trip_delete_command.dart';

abstract class TripDeleteCommandHandler {
  Future<void> deleteTrip(TripDeleteCommand deleteTrip);
}