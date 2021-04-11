
import 'package:trip_planner/domain/shopping/repository/shopping_item_model.dart';

abstract class ShoppingItemQueryService {
  Future<ShoppingItemModel?> findById(int id);

  Future<List<ShoppingItemModel>> findAllByTripId(int tripId);

  Future<List<ShoppingItemModel>> findAllBoughtByTripId(int tripId);
}