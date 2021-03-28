import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class BudgetUpdateCommand extends Equatable {
  final int id;
  final int tripId;
  final Decimal amount;

  BudgetUpdateCommand({
    required this.id,
    required this.tripId,
    required this.amount,
  });

  @override
  List<Object?> get props => [id, tripId, amount];
}
