import 'package:equatable/equatable.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';

abstract class TripByIdState extends Equatable {
  const TripByIdState();
}

class TripByIdInitial extends TripByIdState {
  static const version = 1;

  const TripByIdInitial();

  @override
  List<Object> get props => [version];
}

class TripByIdLoading extends TripByIdState {
  static const version = 2;

  const TripByIdLoading();

  @override
  List<Object> get props => [version];
}

class TripByIdLoaded extends TripByIdState {
  final TripModel trip;

  const TripByIdLoaded(this.trip);

  @override
  List<Object> get props => [trip];
}

class TripByIdError extends TripByIdState {
  final String message;

  const TripByIdError(this.message);

  @override
  List<Object> get props => [message];
}