import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/domain/budget/commands/create/budget_create_command.dart';
import 'package:trip_planner/domain/budget/commands/create/budget_create_command_handler.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_button.dart';

class BudgetNewForm extends StatefulWidget {
  final int tripId;
  final BudgetCreateCommandHandler commandHandler;
  final VoidCallback onCreated;

  const BudgetNewForm({
    Key? key,
    required this.tripId,
    required this.commandHandler,
    required this.onCreated,
  }) : super(key: key);

  @override
  _BudgetNewFormState createState() =>
      _BudgetNewFormState(tripId, commandHandler, onCreated);
}

class _BudgetNewFormState extends State<BudgetNewForm> {
  final _formKey = GlobalKey<FormState>();
  final int _tripId;
  final BudgetCreateCommandHandler _commandHandler;
  final VoidCallback _onCreated;

  Decimal? _amount;

  _BudgetNewFormState(this._tripId, this._commandHandler, this._onCreated);

  @override
  Widget build(BuildContext context) {
    return BaseCard.rounded(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: _validateAmount,
                onSaved: (value) => _amount = Decimal.tryParse(value!),
                initialValue: "0.0",
                decoration: const InputDecoration(
                  labelText: "Amount",
                  icon: const Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: const Icon(
                      Icons.attach_money,
                      color: const Color(0xFFD04545),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GradientButton(
                onPressed: _handleSubmit,
                gradient: LinearGradients.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check, color: Colors.white, size: 18.0),
                    const SizedBox(width: 8.0),
                    const Text("Create", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    final currentState = _formKey.currentState;
    if (currentState == null || !currentState.validate()) return;
    currentState.save();
    final command = BudgetCreateCommand(amount: _amount!, tripId: _tripId);
    await _commandHandler.handle(command);
    _onCreated();
  }
}

String? _validateAmount(String? amount) {
  if (amount == null || amount.isEmpty) return "Amount is required";
  final decimalAmount = Decimal.tryParse(amount);
  if (decimalAmount == null)
    return "Amount should be a valid number";
  if(decimalAmount <= Decimal.zero) return "Amount should be greater than zero";
  return null;
}
