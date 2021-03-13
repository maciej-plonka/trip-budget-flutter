import 'package:trip_planner/domain/trip/trip_service.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_state.dart';

class TripListCubitImpl extends TripListCubit {
  final TripService _tripService;

  TripListCubitImpl(this._tripService) : super(const TripListInitial());
  Future<void> getAll() async {
    emit(const TripListLoading());
    try {
      final trips = await _tripService.findAll();
      emit(TripListLoaded(trips));
    } on Exception {
      emit(TripListError("Couldn't load trips"));
    }
  }


}