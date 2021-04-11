
import 'package:trip_planner/domain/shopping/repository/shopping_item_model.dart';

abstract class ShoppingRepository {
  Future<void> create(ShoppingItemModel model);

  Future<void> update(ShoppingItemModel model);

  Future<ShoppingItemModel?> findById(int id);

  Future<List<ShoppingItemModel>> findAllByTripId(int id);
}
