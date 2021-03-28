import 'package:equatable/equatable.dart';
import 'package:trip_planner/domain/budget/repository/budget_model.dart';

abstract class BudgetByTripIdState extends Equatable {
  const BudgetByTripIdState();
}

class BudgetByTripIdInitial extends BudgetByTripIdState {
  static final int version = 1;

  const BudgetByTripIdInitial();

  @override
  List<Object?> get props => [version];
}

class BudgetByTripIdLoading extends BudgetByTripIdState {
  static final int version = 2;

  const BudgetByTripIdLoading();

  @override
  List<Object?> get props => [version];
}

class BudgetByTripIdNotFound extends BudgetByTripIdState {
  static final int version = 3;

  const BudgetByTripIdNotFound();


  @override
  List<Object?> get props => [version];
}

class BudgetByTripIdLoaded extends BudgetByTripIdState {
  static final int version = 4;
  final BudgetModel budget;

  BudgetByTripIdLoaded(this.budget);

  @override
  List<Object?> get props => [version, budget];
}

class BudgetByTripIdError extends BudgetByTripIdState {
  static final int version = 5;
  final String message;

  BudgetByTripIdError(this.message);

  @override
  List<Object?> get props => [version, message];
}