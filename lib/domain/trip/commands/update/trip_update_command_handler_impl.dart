import 'package:trip_planner/domain/trip/commands/update/trip_update_command.dart';
import 'package:trip_planner/domain/trip/commands/update/trip_update_command_handler.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

class TripUpdateCommandHandlerImpl extends TripUpdateCommandHandler {
  final TripRepository _tripRepository;

  TripUpdateCommandHandlerImpl(this._tripRepository);

  @override
  Future<void> updateTrip(TripUpdateCommand updateTrip) async {
    final model = TripModel(
      id: updateTrip.id,
      name: updateTrip.name,
      startDate: updateTrip.startDate,
      endDate: updateTrip.endDate,
      imageUrl: updateTrip.imageUrl
    );
    await _tripRepository.update(model);
  }

}