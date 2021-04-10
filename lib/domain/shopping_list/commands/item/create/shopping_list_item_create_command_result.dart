import 'package:equatable/equatable.dart';

abstract class ShoppingListItemCreateCommandResult extends Equatable {
  const ShoppingListItemCreateCommandResult();
}

class Success extends ShoppingListItemCreateCommandResult {
  static int version = 1;

  @override
  List<Object?> get props => [version];
}


class Errors extends ShoppingListItemCreateCommandResult {
  final List<String> messages;
  static int _version = 2;

  const Errors(this.messages);

  @override
  List<Object?> get props => [_version,messages];
}