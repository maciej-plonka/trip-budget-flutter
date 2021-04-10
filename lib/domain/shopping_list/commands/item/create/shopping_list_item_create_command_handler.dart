
import 'package:trip_planner/domain/shopping_list/commands/item/create/shopping_list_item_create_command.dart';
import 'package:trip_planner/domain/shopping_list/commands/item/create/shopping_list_item_create_command_result.dart';

abstract class ShoppingListItemCreateCommandHandler {
  Future<ShoppingListItemCreateCommandResult> handle(ShoppingListItemCreateCommand command);
}
