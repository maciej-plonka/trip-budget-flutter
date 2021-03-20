import 'package:trip_planner/domain/trip/commands/update/update_trip.dart';

abstract class UpdateTripHandler {
  Future<void> updateTrip(UpdateTrip updateTrip);
}