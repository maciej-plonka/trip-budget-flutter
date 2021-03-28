import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/presentation/budget/bloc/budget_by_trip_id/budget_by_trip_id_state.dart';

abstract class BudgetByTripIdCubit  extends Cubit<BudgetByTripIdState> {
  BudgetByTripIdCubit(BudgetByTripIdState initialState) : super(initialState);

  Future<void> getByTripId(int tripId);
}