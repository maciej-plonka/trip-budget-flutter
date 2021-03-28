import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class Budget extends Equatable {
  @primaryKey
  final int? id;
  final int tripId;
  final String amount;

  Budget({this.id, required this.tripId, required this.amount}) : assert(amount.isNotEmpty);

  @override
  List<Object?> get props => [id];
}
