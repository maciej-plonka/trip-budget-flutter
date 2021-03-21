import 'package:trip_planner/domain/trip/commands/delete/delete_trip.dart';

abstract class DeleteTripHandler {
  Future<void> deleteTrip(DeleteTrip deleteTrip);
}