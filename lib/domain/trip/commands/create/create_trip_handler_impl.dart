import 'package:trip_planner/domain/trip/commands/create/create_trip.dart';
import 'package:trip_planner/domain/trip/commands/create/create_trip_handler.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';
import 'package:trip_planner/domain/trip/trip_repository.dart';

class CreateTripHandlerImpl implements CreateTripHandler {
  final TripRepository _tripRepository;

  CreateTripHandlerImpl(this._tripRepository);

  @override
  Future<void> createTrip(CreateTrip createTrip) async {
    final tripModel = TripModel(
      name: createTrip.name,
      startDate: createTrip.startDate,
      endDate: createTrip.endDate,
      imageUrl: createTrip.imageUrl
    );
    return _tripRepository.create(tripModel);
  }

}