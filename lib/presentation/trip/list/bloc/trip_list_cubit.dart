import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/domain/trip/trip_service.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_state.dart';

class TripListCubit extends Cubit<TripListState> {
  final TripService _tripService;

  TripListCubit(this._tripService) : super(TripListInitial());

  Future<void> getAll() async {
    emit(const TripListLoading());
    final trips = await _tripService.findAll();
    emit(TripListLoaded(trips));
  }
}
