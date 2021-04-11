import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/presentation/shopping/bloc/filtered_search_cubit/shopping_filtered_search_state.dart';

abstract class ShoppingFilteredSearchCubit  extends Cubit<ShoppingFilteredSearchState> {
  ShoppingFilteredSearchCubit(ShoppingFilteredSearchState initialState) : super(initialState);

  Future<void> getAllByTrip(int tripId);
  Future<void> getAllBoughtByTrip(int tripId);
}