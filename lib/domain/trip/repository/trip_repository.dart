
import 'package:trip_planner/domain/trip/repository/trip_model.dart';

abstract class TripRepository {
  Future<List<TripModel>> findAll();
  Future<TripModel?> findById(int tripId);

  Future<void> create(TripModel tripModel);

  Future<void> update(TripModel tripModel);

  Future<void> deleteById(int tripId);
}