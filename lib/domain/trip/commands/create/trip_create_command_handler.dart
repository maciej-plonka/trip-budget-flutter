
import 'trip_create_command.dart';

abstract class TripCreateCommandHandler {
  Future<void> createTrip(TripCreateCommand createTrip);
}
