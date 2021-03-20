import 'package:equatable/equatable.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';

abstract class TripListState extends Equatable{
  const TripListState();
}
class TripListInitial extends TripListState{
  static const version =  1;
  const TripListInitial();

  @override
  List<Object> get props => [version];
}

class TripListLoading extends TripListState {
  static const version = 2;
  const TripListLoading();

  @override
  List<Object> get props => [version];
}

class TripListError extends TripListState {
  static const version = 3;
  final String error;
  TripListError(this.error);

  @override
  List<Object> get props => [version, error];
}

class TripListLoaded extends TripListState {
  static const version = 4;
  final List<TripModel> trips;
  TripListLoaded(this.trips);

  @override
  List<Object> get props => [version, trips];
}
