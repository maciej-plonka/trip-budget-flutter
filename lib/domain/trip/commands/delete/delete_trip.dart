import 'package:equatable/equatable.dart';

class DeleteTrip extends Equatable {
  final int tripId;

  const DeleteTrip(this.tripId);

  @override
  List<Object?> get props => [tripId];
}