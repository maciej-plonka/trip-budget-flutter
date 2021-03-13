import 'package:trip_planner/data/trip/trip.dart';
import 'package:trip_planner/data/trip/trip_dao.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';
import 'package:trip_planner/domain/trip/trip_repository.dart';

class TripDatabaseRepository implements TripRepository {
  final TripDao _tripDao;

  TripDatabaseRepository(this._tripDao);

  @override
  Future<List<TripModel>> findAll() async {
    final trips = await _tripDao.findAll();
    return trips.map(_mapEntityToModel).toList();
  }

  TripModel _mapEntityToModel(Trip trip) {
    return TripModel(
        id: trip.id,
        name: trip.name,
        startDate: DateTime.fromMicrosecondsSinceEpoch(trip.startDateTime),
        endDate: DateTime.fromMicrosecondsSinceEpoch(trip.endDateTime),
        imageUrl: trip.imageUrl);
  }

  Trip _mapModelToEntity(TripModel model) {
    return Trip(
        id: model.id,
        name: model.name,
        startDateTime: model.startDate.microsecondsSinceEpoch,
        endDateTime: model.endDate.microsecondsSinceEpoch,
        imageUrl: model.imageUrl
    );
  }

  @override
  Future<void> create(TripModel tripModel) async {
    await _tripDao.insertTrip(_mapModelToEntity(tripModel));
  }

  @override
  Future<void> update(TripModel tripModel) async {
    await _tripDao.insertTrip(_mapModelToEntity(tripModel));
  }
}
