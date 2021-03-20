import 'package:get_it/get_it.dart';
import 'package:trip_planner/data/database.dart';
import 'package:trip_planner/data/trip/trip_dao.dart';
import 'package:trip_planner/data/trip/trip_database_repository.dart';
import 'package:trip_planner/domain/trip/commands/create/create_trip_handler.dart';
import 'package:trip_planner/domain/trip/commands/create/create_trip_handler_impl.dart';
import 'package:trip_planner/domain/trip/commands/update/update_trip_handler.dart';
import 'package:trip_planner/domain/trip/commands/update/update_trip_handler_impl.dart';
import 'package:trip_planner/domain/trip/query/trip_query_service.dart';
import 'package:trip_planner/domain/trip/query/trip_query_service_impl.dart';
import 'package:trip_planner/domain/trip/repository/trip_repository.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_by_id/trip_by_id_cubit_impl.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_cubit.dart';
import 'package:trip_planner/presentation/trip/bloc/trip_list/trip_list_cubit_impl.dart';

final dependencies = GetIt.instance;

void setupDependencies(AppDatabase database){
  dependencies.registerLazySingleton<TripDao>(() => database.tripDao);
  dependencies.registerLazySingleton<TripRepository>(() => TripDatabaseRepository(dependencies()));
  dependencies.registerLazySingleton<TripQueryService>(() => TripQueryServiceImpl(dependencies()));
  dependencies.registerLazySingleton<CreateTripHandler>(() => CreateTripHandlerImpl(dependencies()));
  dependencies.registerLazySingleton<UpdateTripHandler>(() => UpdateTripHandlerImpl(dependencies()));
  dependencies.registerFactory<TripByIdCubit>(() => TripByIdCubitImpl(dependencies()));
  dependencies.registerFactory<TripListCubit>(() => TripListCubitImpl(dependencies()));
}