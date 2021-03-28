import 'package:trip_planner/domain/budget/query/budget_query_service.dart';
import 'package:trip_planner/domain/budget/repository/budget_model.dart';
import 'package:trip_planner/domain/budget/repository/budget_repository.dart';

class BudgetQueryServiceImpl implements BudgetQueryService {
  final BudgetRepository _repository;

  BudgetQueryServiceImpl(this._repository);

  @override
  Future<BudgetModel?> findById(int id) => _repository.findById(id);

  @override
  Future<BudgetModel?> findByTripId(int tripId) =>
      _repository.findByTripId(tripId);
}
