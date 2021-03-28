import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class BudgetCreateCommand extends Equatable {
  final int tripId;
  final Decimal amount;

  BudgetCreateCommand({required this.tripId, required this.amount});

  @override
  List<Object?> get props => [tripId, amount];
}
