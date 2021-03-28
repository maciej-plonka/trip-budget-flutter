import 'package:trip_planner/domain/budget/repository/budget_model.dart';

abstract class BudgetQueryService {
  Future<BudgetModel?> findById(int id);

  Future<BudgetModel?> findByTripId(int tripId);
}
