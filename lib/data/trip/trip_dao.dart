
import 'package:floor/floor.dart';
import 'package:trip_planner/data/trip/trip.dart';

@dao
abstract class TripDao {

  @Query("SELECT * FROM Trip")
  Future<List<Trip>> findAll();

  @insert
  Future<void> insertTrip(Trip trip);
}