import 'package:floor/floor.dart';
import 'package:trip_planner/data/shopping/shopping_item.dart';

@dao
abstract class ShoppingItemDao {
  @Query("SELECT * FROM ShoppingItem WHERE id = :id")
  Future<ShoppingItem?> findById(int id);

  @Query("SELECT * FROM ShoppingItem WHERE tripId = :tripId")
  Future<List<ShoppingItem>> findAllByTripId(int tripId);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> create(ShoppingItem shoppingItem);

  @Update(onConflict: OnConflictStrategy.fail)
  Future<void> update(ShoppingItem shoppingItem);
}