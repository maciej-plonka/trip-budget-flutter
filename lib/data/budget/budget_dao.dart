import 'package:floor/floor.dart';
import 'package:trip_planner/data/budget/budget.dart';

@dao
abstract class BudgetDao {
  @Query("SELECT * FROM Budget where id = :budgetId")
  Future<Budget?> findById(int budgetId);

  @Query("SELECT * FROM Budget where tripId = :tripId")
  Future<Budget?> findByTripId(int tripId);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> create(Budget budget);

  @Update(onConflict: OnConflictStrategy.fail)
  Future<void> update(Budget budget);
}