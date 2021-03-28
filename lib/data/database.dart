import "dart:async";
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:trip_planner/data/budget/budget.dart';
import 'package:trip_planner/data/budget/budget_dao.dart';
import 'package:trip_planner/data/trip/trip.dart';
import 'package:trip_planner/data/trip/trip_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Trip, Budget])
abstract class AppDatabase extends FloorDatabase {
  TripDao get tripDao;
  BudgetDao get budgetDao;
}