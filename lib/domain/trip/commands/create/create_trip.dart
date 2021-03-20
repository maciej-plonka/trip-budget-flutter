import 'package:equatable/equatable.dart';

class CreateTrip extends Equatable {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String? imageUrl;

  CreateTrip(
      {required this.name,
      required this.startDate,
      required this.endDate,
      this.imageUrl})
      : assert(endDate.isAfter(startDate));

  @override
  List<Object?> get props => [name, startDate, endDate, imageUrl];
}
