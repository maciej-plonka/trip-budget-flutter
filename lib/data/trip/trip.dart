import 'package:floor/floor.dart';

@entity
class Trip {
  @primaryKey
  final int id;
  final String name;
  final int startDateTime;
  final int endDateTime;
  Trip(this.id, this.name, this.startDateTime, this.endDateTime);
}