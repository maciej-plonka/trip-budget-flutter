import 'package:trip_planner/domain/trip/trip_model.dart';

abstract class TripRepository {
  Future<List<TripModel>> findAll();
  Future<void> create(TripModel tripModel);
  Future<void> update(TripModel tripModel);
}