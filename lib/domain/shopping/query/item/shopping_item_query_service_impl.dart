
import 'package:trip_planner/domain/shopping/query/item/shopping_item_query_service.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_item_model.dart';
import 'package:trip_planner/domain/shopping/repository/shopping_repository.dart';

class ShoppingItemQueryServiceImpl implements ShoppingItemQueryService {
  final ShoppingRepository _repository;

  ShoppingItemQueryServiceImpl(this._repository);

  @override
  Future<List<ShoppingItemModel>> findAllByTripId(int tripId)  => _repository.findAllByTripId(tripId);

  Future<ShoppingItemModel?> findById(int id) => _repository.findById(id);

  @override
  Future<List<ShoppingItemModel>> findAllBoughtByTripId(int tripId) => _repository.findAllByTripId(tripId);

}