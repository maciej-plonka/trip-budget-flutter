import 'package:trip_planner/domain/shopping/query/item/shopping_item_query_service.dart';
import 'package:trip_planner/presentation/shopping/bloc/filtered_search_cubit/shopping_filtered_search_cubit.dart';
import 'package:trip_planner/presentation/shopping/bloc/filtered_search_cubit/shopping_filtered_search_state.dart';

class ShoppingFilteredSearchCubitImpl
    extends ShoppingFilteredSearchCubit {
  final ShoppingItemQueryService _queryService;

  ShoppingFilteredSearchCubitImpl(this._queryService)
      : super(const ShoppingFilteredSearchInitial());

  @override
  Future<void> getAllBoughtByTrip(int tripId) async {
    emit(const ShoppingFilteredSearchLoading());
    try {
      final result = await _queryService.findAllBoughtByTripId(tripId);
      emit(ShoppingFilteredSearchLoaded(result));
    } on Error catch (e) {
      emit(ShoppingFilteredSearchError(e.toString()));
    }
  }

  @override
  Future<void> getAllByTrip(int tripId) async {
    emit(const ShoppingFilteredSearchLoading());
    try {
      final result = await _queryService.findAllByTripId(tripId);
      emit(ShoppingFilteredSearchLoaded(result));
    } on Error catch (e) {
      emit(ShoppingFilteredSearchError(e.toString()));
    }
  }
}
