import 'package:decimal/decimal.dart';
import 'package:trip_planner/domain/budget/commands/update/budget_update_command.dart';
import 'package:trip_planner/domain/budget/commands/update/budget_update_command_handler.dart';
import 'package:trip_planner/domain/budget/repository/budget_model.dart';
import 'package:trip_planner/domain/budget/repository/budget_repository.dart';

class BudgetUpdateCommandHandlerImpl implements BudgetUpdateCommandHandler {
  final BudgetRepository _repository;

  BudgetUpdateCommandHandlerImpl(this._repository);

  @override
  Future<void> handle(BudgetUpdateCommand command) {
    if (command.amount <= Decimal.zero) {
      throw ArgumentError.value(
          command.amount, "Amount should be greater than zero");
    }
    final model = BudgetModel(
      id: command.id,
      amount: command.amount,
      tripId: command.tripId
    );
    return _repository.update(model);
  }

}