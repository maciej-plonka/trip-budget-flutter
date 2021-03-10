import 'package:trip_planner/domain/trip/trip_model.dart';
import 'package:trip_planner/domain/trip/trip_repository.dart';
import 'package:trip_planner/domain/trip/trip_service.dart';

class TripServiceImpl implements TripService{
  final TripRepository _repository;

  TripServiceImpl(this._repository);

  @override
  Future<List<TripModel>> findAll() => _repository.findAll();

}