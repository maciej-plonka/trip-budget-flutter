import 'package:trip_planner/domain/trip/commands/delete/delete_trip.dart';
import 'package:trip_planner/domain/trip/commands/delete/delete_trip_handler.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

class DeleteTripHandlerImpl extends DeleteTripHandler{
  final TripRepository _tripRepository;

  DeleteTripHandlerImpl(this._tripRepository);

  @override
  Future<void> deleteTrip(DeleteTrip deleteTrip) async {
    await _tripRepository.deleteById(deleteTrip.tripId);
  }

}