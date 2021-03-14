import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_state.dart';

abstract class TripListCubit extends Cubit<TripListState> {
  TripListCubit(TripListState state) : super(state);

  Future<void> getAll();
}
