import 'package:equatable/equatable.dart';

class TripDeleteCommand extends Equatable {
  final int tripId;

  const TripDeleteCommand(this.tripId);

  @override
  List<Object?> get props => [tripId];
}