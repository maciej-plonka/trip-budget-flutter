import 'package:trip_planner/domain/trip/commands/create/trip_create_command.dart';
import 'package:trip_planner/domain/trip/commands/create/trip_create_command_handler.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

class TripCreateCommandHandlerImpl implements TripCreateCommandHandler {
  final TripRepository _tripRepository;

  TripCreateCommandHandlerImpl(this._tripRepository);

  @override
  Future<void> createTrip(TripCreateCommand createTrip) async {
    final tripModel = TripModel(
      name: createTrip.name,
      startDate: createTrip.startDate,
      endDate: createTrip.endDate,
      imageUrl: createTrip.imageUrl
    );
    return _tripRepository.create(tripModel);
  }

}