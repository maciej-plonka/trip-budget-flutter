import 'package:flutter_test/flutter_test.dart';
import 'package:trip_planner/domain/trip/trip_model.dart';

void main(){
  group("TripModel", () {

    test("should throw error when trying to create trip with null name",(){
      final String nullName = null;
      final DateTime startDate = DateTime.now();
      final DateTime endDate = startDate.add(Duration(days:1));
      expect(() => TripModel(name : nullName, startDate : startDate, endDate : endDate), throwsAssertionError);
    });

    test("should throw error when trying to create trip with null startDate",(){
      final String validName = "Valid name";
      final DateTime nullStartDate = null;
      final DateTime endDate = DateTime.now().add(Duration(days:1));
      expect(() => TripModel( name : validName, startDate : nullStartDate, endDate : endDate), throwsAssertionError);

    });

    test("should throw error when trying to create trip with null endDate",(){
      final String validName = "Valid name";
      final DateTime startDate = DateTime.now();
      final DateTime nullEndDate = null;
      expect(() => TripModel(name : validName, startDate : startDate, endDate : nullEndDate), throwsAssertionError);
    });

    test("should throw error when trying to create trip with endDate before startDate",(){
      final String validName = "Valid name";
      final DateTime startDate = DateTime.now();
      final DateTime endDateBeforeStart = startDate.subtract(Duration(days: 1));
      expect(() => TripModel(id: 1, name : validName, startDate : startDate, endDate : endDateBeforeStart), throwsAssertionError);
    });
  });
}