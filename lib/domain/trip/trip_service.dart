import 'package:trip_planner/domain/trip/trip_model.dart';

abstract class TripService {

  Future<List<TripModel>> findAll();
}