import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:trip_planner/domain/shopping_list/commands/item/create/shopping_list_item_create_command.dart';
import 'package:trip_planner/domain/shopping_list/commands/item/create/shopping_list_item_create_command_handler.dart';
import 'package:trip_planner/domain/shopping_list/commands/item/create/shopping_list_item_create_command_handler_impl.dart';
import 'package:trip_planner/domain/shopping_list/commands/item/create/shopping_list_item_create_command_result.dart';
import 'package:trip_planner/domain/shopping_list/repository/shopping_list_repository.dart';

import 'shopping_list_item_create_command_handler_impl_test.mocks.dart';

@GenerateMocks([ShoppingListRepository])
void main() {
  group("ShoppingListItemCreateCommandHandlerImpl handle()", () {
    test("should return errors when amount is zero", () async {
      final repository = MockShoppingListRepository();
      final classUnderTest = _classUnderTest(repository);
      final commandWithZeroAmount = _sampleCommand(amount: Decimal.zero);

      final result = await classUnderTest.handle(commandWithZeroAmount);

      expect(result, isA<Errors>());
      });

    test("should return errors when amount is negative", () async {
      final repository = MockShoppingListRepository();
      final classUnderTest = _classUnderTest(repository);
      final commandWithNegativeAmount = _sampleCommand(amount: Decimal.parse("-1"));

      final result = await classUnderTest.handle(commandWithNegativeAmount);

      expect(result, isA<Errors>());
    });

    test("should return errors when name is empty", () async {
      final repository = MockShoppingListRepository();
      final classUnderTest = _classUnderTest(repository);
      final commandWithEmptyName = _sampleCommand(name: "");

      final result = await classUnderTest.handle(commandWithEmptyName);

      expect(result, isA<Errors>());
    });

    test("should return errors when name is blank", () async {
      final repository = MockShoppingListRepository();
      final classUnderTest = _classUnderTest(repository);
      final commandWithBlankName = _sampleCommand(name: "       ");

      final result = await classUnderTest.handle(commandWithBlankName);

      expect(result, isA<Errors>());
    });

    test("should return Success when command is valid", () async {
      final repository = MockShoppingListRepository();
      final classUnderTest = _classUnderTest(repository);
      final validCommand = _sampleCommand();

      final result = await classUnderTest.handle(validCommand);

      expect(result, isA<Success>());
    });

    test("should return Success with 2 messages when both name and amount are invalid", () async {
      final repository = MockShoppingListRepository();
      final classUnderTest = _classUnderTest(repository);
      final invalidCommand = _sampleCommand(
        name: "",
        amount: Decimal.zero
      );

      final result = await classUnderTest.handle(invalidCommand);

      expect(result, isA<Errors>());
      expect((result as Errors).messages.length, 2);
    });

  });
}

ShoppingListItemCreateCommand _sampleCommand({
  int tripId = 1,
  Decimal? amount,
  String name = "Valid name",
  String comment = "",
}) {
  final finalAmount = amount ?? Decimal.one;
  return ShoppingListItemCreateCommand(tripId: tripId, amount: finalAmount, name: name, comment: comment);
}


ShoppingListItemCreateCommandHandler _classUnderTest(
        ShoppingListRepository repository) =>
    ShoppingListItemCreateCommandHandlerImpl(repository);
