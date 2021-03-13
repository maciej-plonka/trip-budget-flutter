import 'package:trip_planner/data/database.dart';

Future<AppDatabase> prepareDatabase(String filename) {
  return $FloorAppDatabase.databaseBuilder(filename).build();
}