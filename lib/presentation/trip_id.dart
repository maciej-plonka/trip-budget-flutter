import 'package:flutter/foundation.dart';

@immutable
class TripId {
  final int _value;
  int get value => _value;

  const TripId(this._value);
}
