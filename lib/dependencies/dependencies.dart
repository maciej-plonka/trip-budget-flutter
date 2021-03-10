import 'package:get_it/get_it.dart';
import 'package:trip_planner/data/database.dart';
import 'package:trip_planner/data/trip/trip_dao.dart';
import 'package:trip_planner/data/trip/trip_database_repository.dart';
import 'package:trip_planner/domain/trip/trip_repository.dart';
import 'package:trip_planner/domain/trip/trip_service.dart';
import 'package:trip_planner/domain/trip/trip_service_impl.dart';
import 'package:trip_planner/presentation/trip/list/bloc/trip_list_cubit.dart';

final dependencies = GetIt.instance;

void setupDependencies(AppDatabase database){
  dependencies.registerLazySingleton<TripDao>(() => database.tripDao);
  dependencies.registerLazySingleton<TripRepository>(() => TripDatabaseRepository(dependencies()));
  dependencies.registerLazySingleton<TripService>(() => TripServiceImpl(dependencies()));
  dependencies.registerFactory<TripListCubit>(() => TripListCubit(dependencies()));
}