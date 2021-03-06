import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class ShoppingItemCreateCommand extends Equatable {
  final int tripId;
  final Decimal amount;
  final String name;
  final String comment;

  ShoppingItemCreateCommand(
      {required this.tripId,
      required this.amount,
      required this.name,
      this.comment = ""});

  @override
  List<Object?> get props => [tripId, amount, name, comment];
}
