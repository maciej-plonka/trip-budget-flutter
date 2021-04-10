import 'package:floor/floor.dart';
import 'package:trip_planner/data/shopping_list/shopping_list_item.dart';

@dao
abstract class ShoppingListItemDao {
  @Query("SELECT * FROM ShoppingListItem WHERE id = :id")
  Future<ShoppingListItem?> findById(int id);

  @Query("SELECT * FROM ShoppingListItem WHERE tripId = :tripId")
  Future<List<ShoppingListItem>> findAllByTripId(int tripId);

  @Insert(onConflict: OnConflictStrategy.fail)
  Future<void> create(ShoppingListItem shoppingListItem);

  @Update(onConflict: OnConflictStrategy.fail)
  Future<void> update(ShoppingListItem shoppingListItem);
}