import 'package:trip_planner/domain/trip/query/trip_query_service.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_state.dart';

class TripByIdCubitImpl extends TripByIdCubit {
  final TripQueryService _tripQueryService;
  TripByIdCubitImpl( this._tripQueryService) : super(const TripByIdInitial());

  @override
  Future<void> getTripById(int tripId) async {
    emit(const TripByIdLoading());
    try{
      final trip = await _tripQueryService.findById(tripId);
      if(trip == null) {
        emit(TripByIdError("Trip with id $tripId not found"));
      }else {
        emit(TripByIdLoaded(trip));
      }
    } on Error {
      emit(const TripByIdError("Unknown error"));
    }
  }

}