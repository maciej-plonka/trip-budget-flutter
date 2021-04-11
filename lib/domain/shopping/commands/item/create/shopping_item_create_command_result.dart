import 'package:equatable/equatable.dart';

abstract class ShoppingItemCreateCommandResult extends Equatable {
  const ShoppingItemCreateCommandResult();
}

class Success extends ShoppingItemCreateCommandResult {
  static int version = 1;

  @override
  List<Object?> get props => [version];
}


class Errors extends ShoppingItemCreateCommandResult {
  final List<String> messages;
  static int _version = 2;

  const Errors(this.messages);

  @override
  List<Object?> get props => [_version,messages];
}