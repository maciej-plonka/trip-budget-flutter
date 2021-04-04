import 'package:trip_planner/domain/trip/commands/update/trip_update_command.dart';

abstract class TripUpdateCommandHandler {
  Future<void> updateTrip(TripUpdateCommand updateTrip);
}