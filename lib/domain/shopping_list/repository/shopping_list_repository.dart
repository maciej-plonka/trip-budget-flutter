import 'package:trip_planner/domain/shopping_list/repository/shopping_list_item_model.dart';

abstract class ShoppingListRepository {
  Future<void> create(ShoppingListItemModel model);

  Future<void> update(ShoppingListItemModel model);

  Future<ShoppingListItemModel?> findById(int id);

  Future<List<ShoppingListItemModel>> findAllByTripId(int id);
}
