import 'package:trip_planner/domain/budget/commands/create/budget_create_command.dart';

abstract class BudgetCreateCommandHandler {
  Future<void> handle(BudgetCreateCommand command);
}