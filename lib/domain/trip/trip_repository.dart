import 'package:trip_planner/domain/trip/trip_model.dart';

abstract class TripRepository {
  Future<List<TripModel>> findAll();
}