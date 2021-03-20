import 'package:trip_planner/domain/trip/query/trip_query_service.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';

class TripQueryServiceImpl implements TripQueryService{
  final TripRepository? _repository;

  TripQueryServiceImpl(this._repository);

  @override
  Future<List<TripModel>> findAll() => _repository!.findAll();

  @override
  Future<TripModel?> findById(int tripId) => _repository!.findById(tripId);

}