
import 'package:decimal/decimal.dart';
import 'package:trip_planner/data/budget/budget.dart';
import 'package:trip_planner/data/budget/budget_dao.dart';
import 'package:trip_planner/domain/budget/repository/budget_model.dart';
import 'package:trip_planner/domain/budget/repository/budget_repository.dart';

class BudgetDatabaseRepository implements BudgetRepository {
  final BudgetDao _budgetDao;

  BudgetDatabaseRepository(this._budgetDao);

  @override
  Future<BudgetModel?> findById(int id) async {
    final budget = await _budgetDao.findById(id);
    if (budget == null) {
      return null;
    }
    return _mapToModel(budget);
  }

  @override
  Future<BudgetModel?> findByTripId(int tripId) async {
    final budget = await _budgetDao.findByTripId(tripId);
    if (budget == null) {
      return null;
    }
    return _mapToModel(budget);
  }

  @override
  Future<void> create(BudgetModel budgetModel) {
    return _budgetDao.create(_mapToEntity(budgetModel));
  }

  @override
  Future<void> update(BudgetModel budgetModel) {
    return _budgetDao.update(_mapToEntity(budgetModel));
  }

  BudgetModel _mapToModel(Budget budget) {
    return BudgetModel(
      id: budget.id,
      amount: Decimal.parse(budget.amount),
      tripId: budget.tripId,
    );
  }

  Budget _mapToEntity(BudgetModel model) {
    return Budget(
      id: model.id,
      amount: model.amount.toString(),
      tripId: model.tripId,
    );
  }
}
