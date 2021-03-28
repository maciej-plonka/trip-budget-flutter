import 'package:decimal/decimal.dart';
import 'package:trip_planner/domain/budget/commands/create/budget_create_command.dart';
import 'package:trip_planner/domain/budget/commands/create/budget_create_command_handler.dart';
import 'package:trip_planner/domain/budget/repository/budget_model.dart';
import 'package:trip_planner/domain/budget/repository/budget_repository.dart';

class BudgetCreateCommandHandlerImpl implements BudgetCreateCommandHandler {
  final BudgetRepository _repository;

  BudgetCreateCommandHandlerImpl(this._repository);

  @override
  Future<void> handle(BudgetCreateCommand command) {
    if (command.amount <= Decimal.zero) {
      throw ArgumentError.value(
          command.amount, "Amount should be greater than zero");
    }
    final model = BudgetModel(
      tripId: command.tripId,
      amount: command.amount,
    );
    return _repository.create(model);
  }
}
