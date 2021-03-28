import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class BudgetModel extends Equatable {
  final int? id;
  final int tripId;
  final Decimal amount;

  BudgetModel({this.id, required this.tripId, required this.amount})
      : assert(amount > Decimal.zero);

  @override
  List<Object?> get props => [id];
}
