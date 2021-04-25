import 'package:flutter/widgets.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/domain/shopping/commands/item/create/shopping_item_create_command_handler.dart';
import 'package:trip_planner/presentation/shopping/pages/new/shopping_new_item_form.dart';
import 'package:trip_planner/presentation/shopping/pages/shopping_scaffold.dart';
import 'package:auto_route/auto_route.dart';

class ShoppingNewItemPage extends StatelessWidget {
  final int tripId;
  final void Function()? onCreated;
  final ShoppingItemCreateCommandHandler commandHandler;

  ShoppingNewItemPage(
      {Key? key,
      required this.tripId,
      ShoppingItemCreateCommandHandler? commandHandler,
      this.onCreated})
      : this.commandHandler = commandHandler ?? dependencies(),
        super(key: key);

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
            onCreated: () {
              onCreated?.call();
              context.router.pop();
            },
          ),
        ),
      ),
    );
  }
}
