
import 'package:trip_planner/domain/trip/commands/delete/trip_delete_command.dart';
import 'package:trip_planner/domain/trip/commands/delete/trip_delete_command_handler.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

class TripDeleteCommandHandlerImpl extends TripDeleteCommandHandler{
  final TripRepository _tripRepository;

  TripDeleteCommandHandlerImpl(this._tripRepository);

  @override
  Future<void> deleteTrip(TripDeleteCommand deleteTrip) async {
    await _tripRepository.deleteById(deleteTrip.tripId);
  }

}