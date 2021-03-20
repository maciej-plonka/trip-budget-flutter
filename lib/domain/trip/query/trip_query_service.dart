

import 'package:trip_planner/domain/trip/repository/trip_model.dart';

abstract class TripQueryService {
  Future<List<TripModel>> findAll();

  Future<TripModel?> findById(int tripId);
}