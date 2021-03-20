import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class TripModel extends Equatable {
  final int? id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String? imageUrl;

  TripModel({
    this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    this.imageUrl,
  })  : assert(startDate.isBefore(endDate));

  @override
  List<Object?> get props => [id];
}
