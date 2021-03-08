import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_planner/presentation/router/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
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
        backgroundColor: Color(0xFFEEEEEE),
      ),
      builder: ExtendedNavigator.builder<AutomaticRouter>(
          router: AutomaticRouter(),
          builder: (context, extendedNav) => extendedNav),
    );
  }
}