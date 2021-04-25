import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_planner/data/database_init.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/presentation/router/app_router.gr.dart';

final _appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await prepareDatabase("app_database.db");
  await setupDependencies(database);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme:  AppBarTheme(
          textTheme: TextTheme(
            subtitle1: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            headline6: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Color(0xFFB5B5B5),
      ),
      routerDelegate: _appRouter.delegate(initialRoutes: [TripRoute()]),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
