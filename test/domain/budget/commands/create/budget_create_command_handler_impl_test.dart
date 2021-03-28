import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/budget/commands/create/budget_create_command.dart';
import 'package:trip_planner/domain/budget/commands/create/budget_create_command_handler_impl.dart';
import 'package:trip_planner/domain/budget/repository/budget_repository.dart';

import 'budget_create_command_handler_impl_test.mocks.dart';

@GenerateMocks([BudgetRepository])
void main() {
  group("BudgetCreateCommandHandlerImpl handle()", () {
    test("should correctly pass tripId", () async {
      //given
      final expectedTripId = 1;
      final repository = MockBudgetRepository();
      final classUnderTest = BudgetCreateCommandHandlerImpl(repository);
      //when

      await classUnderTest.handle(_createCommand(tripId: expectedTripId));

      //then
      final actualTripId =
          verify(repository.create(captureAny)).captured.single.tripId as int;
      expect(actualTripId, expectedTripId);
    });

    test("should correctly pass amount", () async {
      //given
      final expectedAmount = Decimal.parse("0.5");
      final repository = MockBudgetRepository();
      final classUnderTest = BudgetCreateCommandHandlerImpl(repository);

      //when
      await classUnderTest.handle(_createCommand(amount: expectedAmount));

      //then
      final actualAmount =
          verify(repository.create(captureAny)).captured.single.amount as Decimal;
      expect(actualAmount, expectedAmount);
    });

    test("should throw exception when passing zero amount", () async {
      //given
      final zeroAmount = Decimal.zero;
      final repository = MockBudgetRepository();
      final classUnderTest = BudgetCreateCommandHandlerImpl(repository);

      //when
      final action = () async => await classUnderTest.handle(_createCommand(amount: zeroAmount));

      //then
      expect(action, throwsA(isA<Error>()));
    });

    test("should throw exception when passing negative amount", () async {
      //given
      final negativeAmount = Decimal.parse("-1");
      final repository = MockBudgetRepository();
      final classUnderTest = BudgetCreateCommandHandlerImpl(repository);

      //when
      final action = () async => await classUnderTest.handle(_createCommand(amount: negativeAmount));

      //then
      expect(action, throwsA(isA<Error>()));
    });
  });
}

BudgetCreateCommand _createCommand({
  int tripId = 1,
  Decimal? amount,
}) {
  final finalAmount = amount ?? Decimal.one;
  return BudgetCreateCommand(tripId: tripId, amount: finalAmount);
}
