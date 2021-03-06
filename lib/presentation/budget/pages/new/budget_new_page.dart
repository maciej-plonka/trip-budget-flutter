import 'package:flutter/material.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/budget/commands/create/budget_create_command_handler.dart';
import 'package:trip_planner/presentation/budget/pages/budget_scaffold.dart';
import 'package:trip_planner/presentation/budget/pages/new/budget_new_form.dart';
import 'package:provider/provider.dart';
import 'package:trip_planner/presentation/trip_id.dart';

class BudgetNewPage extends StatelessWidget {
  final int tripId;
  final BudgetCreateCommandHandler commandHandler;
  final void Function()? onCreated;

  BudgetNewPage({required this.tripId, commandHandler, this.onCreated})
      : this.commandHandler = commandHandler ?? dependencies();

  @override
  Widget build(BuildContext context) {
    return BudgetScaffold(
      titleText: "Create budget",
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: BudgetNewForm(
            tripId: tripId,
            commandHandler: commandHandler,
            onCreated: () {
              onCreated?.call();
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
