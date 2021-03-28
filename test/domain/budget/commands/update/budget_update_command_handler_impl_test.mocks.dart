// Mocks generated by Mockito 5.0.2 from annotations
// in trip_planner/test/domain/budget/commands/update/budget_update_command_handler_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:trip_planner/domain/budget/repository/budget_model.dart' as _i2;
import 'package:trip_planner/domain/budget/repository/budget_repository.dart'
    as _i3;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeBudgetModel extends _i1.Fake implements _i2.BudgetModel {}

/// A class which mocks [BudgetRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBudgetRepository extends _i1.Mock implements _i3.BudgetRepository {
  MockBudgetRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BudgetModel?> findById(int? id) =>
      (super.noSuchMethod(Invocation.method(#findById, [id]),
              returnValue: Future.value(_FakeBudgetModel()))
          as _i4.Future<_i2.BudgetModel?>);
  @override
  _i4.Future<_i2.BudgetModel?> findByTripId(int? tripId) =>
      (super.noSuchMethod(Invocation.method(#findByTripId, [tripId]),
              returnValue: Future.value(_FakeBudgetModel()))
          as _i4.Future<_i2.BudgetModel?>);
  @override
  _i4.Future<void> create(_i2.BudgetModel? tripModel) =>
      (super.noSuchMethod(Invocation.method(#create, [tripModel]),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> update(_i2.BudgetModel? tripModel) =>
      (super.noSuchMethod(Invocation.method(#update, [tripModel]),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
}
