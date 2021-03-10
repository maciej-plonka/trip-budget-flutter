import 'package:trip_planner/domain/trip/trip_model.dart';

abstract class TripListState{
  const TripListState();
}
class TripListInitial extends TripListState{
  const TripListInitial();
}

class TripListLoading extends TripListState {
  const TripListLoading();
}

class TripListLoaded extends TripListState {
  final List<TripModel> trips;
  TripListLoaded(this.trips);

  @override
  bool operator ==(Object other) {
    if(identical(this, other)) return true;
    return other is TripListLoaded && other.trips == trips;
  }

  @override
  int get hashCode => trips.hashCode;
}
