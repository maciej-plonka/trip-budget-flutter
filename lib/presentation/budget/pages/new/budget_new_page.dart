import 'package:flutter/material.dart';
import 'package:trip_planner/domain/budget/commands/create/budget_create_command_handler.dart';
import 'package:trip_planner/presentation/budget/pages/budget_page_scaffold.dart';
import 'package:trip_planner/presentation/budget/pages/new/budget_new_form.dart';

class BudgetNewPage extends StatelessWidget {
  final int tripId;
  final BudgetCreateCommandHandler commandHandler;

  BudgetNewPage({required this.tripId, required this.commandHandler});

  @override
  Widget build(BuildContext context) {
    return BudgetPageScaffold(
      titleText: "Create budget",
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18.0),
          child: BudgetNewForm(
            tripId: tripId,
            commandHandler: commandHandler,
            onCreated: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
