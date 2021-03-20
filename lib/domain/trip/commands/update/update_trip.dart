import 'package:equatable/equatable.dart';

class UpdateTrip extends Equatable {
  final int id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String? imageUrl;

  UpdateTrip(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.endDate,
      this.imageUrl})
      : assert(endDate.isAfter(startDate));

  @override
  List<Object?> get props => [id,name, startDate, endDate, imageUrl];
}
