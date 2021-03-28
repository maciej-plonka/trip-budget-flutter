import 'package:trip_planner/domain/budget/repository/budget_model.dart';

abstract class BudgetRepository {
  Future<BudgetModel?> findById(int id);

  Future<BudgetModel?> findByTripId(int tripId);

  Future<void> create(BudgetModel tripModel);

  Future<void> update(BudgetModel tripModel);
}
