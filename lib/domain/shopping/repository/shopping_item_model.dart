import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class ShoppingItemModel extends Equatable {
  final int? id;
  final int tripId;
  final Decimal amount;
  final String name;
  final String comment;

  ShoppingItemModel({required this.id,
    required this.tripId,
    required this.amount,
    required this.name,
    required this.comment});

  @override
  List<Object?> get props =>[id,tripId,amount,name,comment];
}
