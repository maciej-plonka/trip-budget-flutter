import 'package:flutter/widgets.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command_handler.dart';
import 'package:trip_planner/presentation/shopping/pages/new/shopping_new_item_form.dart';
import 'package:trip_planner/presentation/shopping/pages/shopping_scaffold.dart';

class ShoppingNewItemPage extends StatelessWidget {
  final int tripId;
  final ShoppingItemCreateCommandHandler commandHandler;

  const ShoppingNewItemPage({Key? key, required this.tripId, required this.commandHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShoppingScaffold(
      titleText: "New Shopping item",
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: ShoppingNewItemForm(
            tripId: tripId,
            commandHandler: commandHandler,
            onCreated: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
