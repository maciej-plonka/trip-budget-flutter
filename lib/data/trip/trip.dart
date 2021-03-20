
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class Trip extends Equatable {
  @primaryKey
  final int? id;
  final String name;
  final int startDateTime;
  final int endDateTime;
  final String? imageUrl;

  Trip(
      {this.id,
      required this.name,
      required this.startDateTime,
      required this.endDateTime,
      this.imageUrl});

  @override
  List<Object?> get props => [id];
}