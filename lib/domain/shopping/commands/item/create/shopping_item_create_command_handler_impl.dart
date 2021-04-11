import 'package:decimal/decimal.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command_handler.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command_result.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_item_model.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_repository.dart';

class ShoppingItemCreateCommandHandlerImpl
    implements ShoppingItemCreateCommandHandler {
  final ShoppingRepository _repository;

  ShoppingItemCreateCommandHandlerImpl(this._repository);

  Future<ShoppingItemCreateCommandResult> handle(
      ShoppingItemCreateCommand command) async {
    final errorMessages = _validateCommand(command);
    if (errorMessages.isNotEmpty) {
      return Errors(errorMessages);
    }
    final item = ShoppingItemModel(
      id: null,
      tripId: command.tripId,
      amount: command.amount,
      name: command.name,
      comment: command.comment,
    );
    try {
      await _repository.create(item);
    } on Error catch (e) {
      return Errors([e.toString()]);
    }
    return Success();
  }

  List<String> _validateCommand(ShoppingItemCreateCommand command) {
    final List<String> errorMessages = [];
    if (command.amount <= Decimal.zero) {
      errorMessages.add("Amount should be greater than zero");
    }
    if (command.name.trim().isEmpty) {
      errorMessages.add("Name should not be empty");
    }
    return errorMessages;
  }
}
