import 'package:decimal/decimal.dart';
import 'package:trip_planner/data/budget/budget.dart';
import 'package:trip_planner/data/budget/budget_dao.dart';
import 'package:trip_planner/data/shopping_list/shopping_list_item.dart';
import 'package:trip_planner/data/shopping_list/shopping_list_item_dao.dart';
import 'package:trip_planner/domain/budget/repository/budget_model.dart';
import 'package:trip_planner/domain/budget/repository/budget_repository.dart';
import 'package:trip_planner/domain/shopping_list/repository/shopping_list_item_model.dart';
import 'package:trip_planner/domain/shopping_list/repository/shopping_list_repository.dart';

class ShoppingListDatabaseRepository implements ShoppingListRepository {
  final ShoppingListItemDao _itemDao;

  ShoppingListDatabaseRepository(this._itemDao);

  @override
  Future<void> create(ShoppingListItemModel shoppingItemModel) {
    return _itemDao.create(_mapToEntity(shoppingItemModel));
  }

  @override
  Future<void> update(ShoppingListItemModel budgetModel) {
    return _itemDao.update(_mapToEntity(budgetModel));
  }

  @override
  Future<ShoppingListItemModel?> findById(int id) async {
    final shoppingItem = await _itemDao.findById(id);
    if (shoppingItem == null) {
      return null;
    }
    return _mapToModel(shoppingItem);
  }

  @override
  Future<List<ShoppingListItemModel>> findAllByTripId(int tripId) async {
    final items = await _itemDao.findAllByTripId(tripId);
    return items.map((e) => _mapToModel(e)).toList();
  }

  ShoppingListItemModel _mapToModel(ShoppingListItem shoppingItem) {
    return ShoppingListItemModel(
        id: shoppingItem.id,
        amount: Decimal.parse(shoppingItem.amount),
        tripId: shoppingItem.tripId,
        name: shoppingItem.name,
        comment: shoppingItem.comment);
  }

  ShoppingListItem _mapToEntity(ShoppingListItemModel model) {
    return ShoppingListItem(
        id: model.id,
        amount: model.amount.toString(),
        tripId: model.tripId,
        name: model.name,
        comment: model.comment);
  }
}
