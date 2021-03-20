import 'package:flutter_test/flutter_test.dart';
import 'package:trip_planner/domain/trip/repository/trip_model.dart';

void main(){
  group("TripModel", () {

    test("should throw error when trying to create trip with endDate before startDate",(){
      final String validName = "Valid name";
      final DateTime startDate = DateTime.now();
      final DateTime endDateBeforeStart = startDate.subtract(Duration(days: 1));
      expect(() => TripModel(id: 1, name : validName, startDate : startDate, endDate : endDateBeforeStart), throwsAssertionError);
    });
  });
}