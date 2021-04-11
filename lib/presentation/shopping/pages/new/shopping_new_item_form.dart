import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command_handler.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command_result.dart';
import 'package:trip_planner/presentation/linear_gradients.dart';
import 'package:trip_planner/presentation/widgets/base_card.dart';
import 'package:trip_planner/presentation/widgets/button/gradient_button.dart';

class ShoppingNewItemForm extends StatefulWidget {
  final int tripId;
  final ShoppingItemCreateCommandHandler commandHandler;
  final VoidCallback onCreated;

  const ShoppingNewItemForm({
    Key? key,
    required this.tripId,
    required this.commandHandler,
    required this.onCreated,
  }) : super(key: key);

  @override
  _ShoppingNewItemFormState createState() => _ShoppingNewItemFormState();
}

class _ShoppingNewItemFormState extends State<ShoppingNewItemForm> {
  final _formKey = GlobalKey<FormState>();

  late Decimal _amount;
  late String _name;
  late String _comment = "";

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
                validator: _validateName,
                initialValue: "",
                onSaved: (value) => _name = value!,
                decoration: const InputDecoration(
                  labelText: "Name",
                  icon: const Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: const Icon(
                      Icons.sticky_note_2,
                      color: const Color(0xFFD04545),
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: _validateAmount,
                onSaved: (value) => _amount = Decimal.parse(value!),
                initialValue: "",
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
              TextFormField(
                onSaved: (value) => _comment = value ?? "",
                decoration: const InputDecoration(
                  labelText: "Comments",
                  icon: const Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: const Icon(
                      Icons.sticky_note_2,
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
    final command = ShoppingItemCreateCommand(
      amount: _amount,
      name: _name,
      comment: _comment,
      tripId: widget.tripId,
    );
    final result = await widget.commandHandler.handle(command);
    if (result is Success) {
      widget.onCreated();
    } else if (result is Errors) {
      final errors = result.messages.join("\n");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: new Text(errors)),
      );
    }
  }
}

String? _validateAmount(String? amount) {
  if (amount == null || amount.isEmpty) return "Amount is required";
  final decimalAmount = Decimal.tryParse(amount);
  if (decimalAmount == null) return "Amount should be a valid number";
  if (decimalAmount <= Decimal.zero)
    return "Amount should be greater than zero";
  return null;
}

String? _validateName(String? name) {
  if (name == null || name.trim().isEmpty) return "Name cannot be empty";
  return null;
}
