import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_item_model.dart';

abstract class ShoppingFilteredSearchState extends Equatable {
  const ShoppingFilteredSearchState();
}

@immutable
class ShoppingFilteredSearchInitial
    extends ShoppingFilteredSearchState {
  static final int _version = 1;

  const ShoppingFilteredSearchInitial();

  @override
  List<Object?> get props => [_version];
}

@immutable
class ShoppingFilteredSearchLoading
    extends ShoppingFilteredSearchState {
  static final int _version = 2;

  const ShoppingFilteredSearchLoading();

  @override
  List<Object?> get props => [_version];
}

@immutable
class ShoppingFilteredSearchLoaded extends ShoppingFilteredSearchState {
  static final int _version = 3;
  final List<ShoppingItemModel> items;

  ShoppingFilteredSearchLoaded(this.items);

  @override
  List<Object?> get props => [_version, items];
}

@immutable
class ShoppingFilteredSearchError extends ShoppingFilteredSearchState {
  static final int _version = 4;
  final String error;

  ShoppingFilteredSearchError(this.error);

  @override
  List<Object?> get props => [_version, error];
}
