import 'package:flutter/material.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/presentation/budget/pages/home/budget_home_page.dart';
import 'package:trip_planner/presentation/budget/pages/new/budget_new_page.dart';
import 'package:trip_planner/presentation/trip/pages/details/trip_details_page.dart';
import 'package:trip_planner/presentation/trip/pages/edit/trip_edit_page.dart';
import 'package:trip_planner/presentation/trip/pages/list/trip_list_page.dart';
import 'package:trip_planner/presentation/trip/pages/new/trip_new_page.dart';

class Routes {
  static const tripList = "/";
  static const tripNew = "/trip/new";
  static const tripDetails = "/trip/details";
  static const tripEdit = "/trip/edit";
  static const budgetHome = "/budget";
  static const budgetNew = "/budget/new";
  static const shoppingListHome = "/shoppingList";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.tripList:
        return MaterialPageRoute(builder: (_) => TripListPage());
      case Routes.tripNew:
        return MaterialPageRoute(builder: (_) => TripNewPage());
      case Routes.tripDetails:
        if (args is int)
          return MaterialPageRoute(
              builder: (_) => TripDetailsPage(tripId: args));
        return _error("TripDetailsPage requires tripId");
      case Routes.tripEdit:
        if (args is int)
          return MaterialPageRoute(builder: (_) => TripEditPage(tripId: args));
        return _error("TripEditPage requires tripId");
      case Routes.budgetHome:
        if (args is int)
          return MaterialPageRoute(
              builder: (_) =>
                  BudgetHomePage(tripId: args, cubit: dependencies()));
        return _error("BudgetHomePage requires tripId");
      case Routes.budgetNew:
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) =>
                  BudgetNewPage(tripId: args, commandHandler: dependencies()));
        }
        return _error("BudgetNewPage requires tripId");
    }
    return _error("Unknown route: ${settings.name}");
  }

  static MaterialPageRoute<dynamic> _error(String message) {
    return MaterialPageRoute(builder: (_) => _ErrorPage(message: message));
  }
}

class _ErrorPage extends StatelessWidget {
  final String message;

  const _ErrorPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text(
          "$message",
          style: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
