// Mocks generated by Mockito 5.0.5 from annotations
// in trip_planner/test/presentation/trip/pages/list/trip_list_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:trip_planner/domain/trip/query/trip_query_service.dart' as _i3;
import 'package:trip_planner/domain/trip/repository/trip_model.dart' as _i2;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeTripModel extends _i1.Fake implements _i2.TripModel {}

/// A class which mocks [TripQueryService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTripQueryService extends _i1.Mock implements _i3.TripQueryService {
  MockTripQueryService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i2.TripModel>> findAll() =>
      (super.noSuchMethod(Invocation.method(#findAll, []),
              returnValue: Future<List<_i2.TripModel>>.value(<_i2.TripModel>[]))
          as _i4.Future<List<_i2.TripModel>>);
  @override
  _i4.Future<_i2.TripModel?> findById(int? tripId) =>
      (super.noSuchMethod(Invocation.method(#findById, [tripId]),
              returnValue: Future<_i2.TripModel?>.value(_FakeTripModel()))
          as _i4.Future<_i2.TripModel?>);
}
