import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class CreateTrip extends Equatable {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String imageUrl;

  CreateTrip(
      {@required this.name,
      @required this.startDate,
      @required this.endDate,
      this.imageUrl})
      : assert(name != null),
        assert(startDate != null),
        assert(endDate != null),
        assert(endDate.isAfter(startDate));

  @override
  List<Object> get props => [name, startDate, endDate, imageUrl];
}
