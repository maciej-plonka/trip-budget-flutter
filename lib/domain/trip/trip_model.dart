import 'package:flutter/widgets.dart';

@immutable
class TripModel {
  final int id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;

  TripModel( {@required this.id,@required this.name, @required this.startDate, @required this.endDate})
      : assert(id != null),
        assert(name != null),
        assert(startDate != null),
        assert(endDate != null),
        assert(startDate.isBefore(endDate));

  @override
  int get hashCode => name.hashCode ^ startDate.hashCode ^ endDate.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TripModel && other.hashCode == hashCode;
  }
}
