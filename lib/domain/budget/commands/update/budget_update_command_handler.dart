import 'package:trip_planner/domain/budget/commands/update/budget_update_command.dart';

abstract class BudgetUpdateCommandHandler {
  Future<void> handle(BudgetUpdateCommand command);
}