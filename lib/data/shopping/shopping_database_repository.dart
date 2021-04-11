import 'package:decimal/decimal.dart';
import 'package:trip_planner/data/shopping/shopping_item.dart';
import 'package:trip_planner/data/shopping/shopping_item_dao.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_item_model.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_repository.dart';

class ShoppingDatabaseRepository implements ShoppingRepository {
  final ShoppingItemDao _itemDao;

  ShoppingDatabaseRepository(this._itemDao);

  @override
  Future<void> create(ShoppingItemModel shoppingItemModel) {
    return _itemDao.create(_mapToEntity(shoppingItemModel));
  }

  @override
  Future<void> update(ShoppingItemModel budgetModel) {
    return _itemDao.update(_mapToEntity(budgetModel));
  }

  @override
  Future<ShoppingItemModel?> findById(int id) async {
    final shoppingItem = await _itemDao.findById(id);
    if (shoppingItem == null) {
      return null;
    }
    return _mapToModel(shoppingItem);
  }

  @override
  Future<List<ShoppingItemModel>> findAllByTripId(int tripId) async {
    final items = await _itemDao.findAllByTripId(tripId);
    return items.map((e) => _mapToModel(e)).toList();
  }

  ShoppingItemModel _mapToModel(ShoppingItem shoppingItem) {
    return ShoppingItemModel(
        id: shoppingItem.id,
        amount: Decimal.parse(shoppingItem.amount),
        tripId: shoppingItem.tripId,
        name: shoppingItem.name,
        comment: shoppingItem.comment);
  }

  ShoppingItem _mapToEntity(ShoppingItemModel model) {
    return ShoppingItem(
        id: model.id,
        amount: model.amount.toString(),
        tripId: model.tripId,
        name: model.name,
        comment: model.comment);
  }
}
