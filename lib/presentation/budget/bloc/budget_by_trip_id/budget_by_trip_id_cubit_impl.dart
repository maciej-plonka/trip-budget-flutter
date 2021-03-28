import 'package:trip_planner/domain/budget/query/budget_query_service.dart';
import 'package:trip_planner/presentation/budget/bloc/budget_by_trip_id/budget_by_trip_id_cubit.dart';
import 'package:trip_planner/presentation/budget/bloc/budget_by_trip_id/budget_by_trip_id_state.dart';

class BudgetByTripIdCubitImpl extends BudgetByTripIdCubit {
  final BudgetQueryService _budgetQueryService;

  BudgetByTripIdCubitImpl(this._budgetQueryService)
      : super(const BudgetByTripIdInitial());

  @override
  Future<void> getByTripId(int tripId) async {
    try {
      emit(const BudgetByTripIdLoading());
      final budget = await _budgetQueryService.findByTripId(tripId);
      if(budget == null) {
        emit(const BudgetByTripIdNotFound());
      }else {
        emit(BudgetByTripIdLoaded(budget));
      }
    } on Exception catch (e) {
      emit(BudgetByTripIdError(e.toString()));
    }
  }
}
