import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trip_planner/domain/trip/commands/create/create_trip.dart';
import 'package:trip_planner/domain/trip/commands/create/create_trip_handler_impl.dart';
import 'package:trip_planner/domain/trip/trip_repository.dart';

void main() {
  final tripRepository = _TripRepositoryMock();

  setUp(() => reset(tripRepository));

  group("CreateTripHandlerImpl create()",() {
    test("should properly pass name of a trip to TripModel", () async {
      //given
      when(tripRepository.create(any)).thenAnswer((_) => Future.value());
      final tripName = "Trip Name";
      final createTrip = CreateTrip(name: tripName, startDate: DateTime(2020), endDate: DateTime(2021));
      final classUnderTest = CreateTripHandlerImpl(tripRepository);
      //when
      await classUnderTest.createTrip(createTrip);
      //then
      expect(verify(tripRepository.create(captureAny)).captured.single.name, tripName );
    });

    test("should properly pass startDate of a trip to TripModel", () async {
      //given
      when(tripRepository.create(any)).thenAnswer((_) => Future.value());
      final startDate = DateTime(2020);
      final createTrip = CreateTrip(name: "Trip Name", startDate: startDate, endDate: DateTime(2021));
      final classUnderTest = CreateTripHandlerImpl(tripRepository);
      //when
      await classUnderTest.createTrip(createTrip);
      //then
      expect(verify(tripRepository.create(captureAny)).captured.single.startDate, startDate );
    });

    test("should properly pass endDate of a trip to TripModel", () async {
      //given
      when(tripRepository.create(any)).thenAnswer((_) => Future.value());
      final endDate = DateTime(2021);
      final createTrip = CreateTrip(name: "Trip Name", startDate: DateTime(2020), endDate:endDate);
      final classUnderTest = CreateTripHandlerImpl(tripRepository);
      //when
      await classUnderTest.createTrip(createTrip);
      //then
      expect(verify(tripRepository.create(captureAny)).captured.single.endDate, endDate );
    });

    test("should properly pass null imageUrl of a trip to TripModel", () async {
      //given
      when(tripRepository.create(any)).thenAnswer((_) => Future.value());
      String nullImageUrl = null;
      final createTrip = CreateTrip(name: "Trip Name", startDate: DateTime(2020), endDate:DateTime(2021), imageUrl: nullImageUrl);
      final classUnderTest = CreateTripHandlerImpl(tripRepository);
      //when
      await classUnderTest.createTrip(createTrip);
      //then
      expect(verify(tripRepository.create(captureAny)).captured.single.imageUrl, nullImageUrl );
    });

    test("should properly pass valid imageUrl of a trip to TripModel", () async {
      //given
      when(tripRepository.create(any)).thenAnswer((_) => Future.value());
      String validImageUrl = "image url";
      final createTrip = CreateTrip(name: "Trip Name", startDate: DateTime(2020), endDate:DateTime(2021), imageUrl: validImageUrl);
      final classUnderTest = CreateTripHandlerImpl(tripRepository);
      //when
      await classUnderTest.createTrip(createTrip);
      //then
      expect(verify(tripRepository.create(captureAny)).captured.single.imageUrl, validImageUrl );
    });
  });
}

class _TripRepositoryMock extends Mock implements TripRepository {}
