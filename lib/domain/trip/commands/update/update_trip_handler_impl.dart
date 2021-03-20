import 'package:trip_planner/domain/trip/commands/update/update_trip.dart';
import 'package:trip_planner/domain/trip/commands/update/update_trip_handler.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

class UpdateTripHandlerImpl extends UpdateTripHandler {
  final TripRepository _tripRepository;

  UpdateTripHandlerImpl(this._tripRepository);

  @override
  Future<void> updateTrip(UpdateTrip updateTrip) async {
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