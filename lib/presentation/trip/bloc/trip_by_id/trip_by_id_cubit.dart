import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_state.dart';

abstract class TripByIdCubit extends Cubit<TripByIdState> {
  TripByIdCubit(TripByIdState initialState) : super(initialState);

  Future<void> getTripById(int tripId);
}