import 'package:floor/floor.dart';

@entity
class ShoppingListItem {
  @primaryKey
  final int? id;
  final int tripId;
  final String amount;
  final String name;
  final String comment;

  ShoppingListItem({
    this.id,
    required this.tripId,
    required this.amount,
    required this.name,
    required this.comment});
}
