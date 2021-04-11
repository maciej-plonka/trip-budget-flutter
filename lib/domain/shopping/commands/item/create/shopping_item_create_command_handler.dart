
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command_result.dart';

abstract class ShoppingItemCreateCommandHandler {
  Future<ShoppingItemCreateCommandResult> handle(ShoppingItemCreateCommand command);
}
