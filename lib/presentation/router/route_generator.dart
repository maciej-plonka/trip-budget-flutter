import 'package:flutter/material.dart';
import 'package:trip_planner/dependencies/dependencies.dart';
import 'package:trip_planner/presentation/budget/pages/home/budget_home_page.dart';
import 'package:trip_planner/presentation/budget/pages/new/budget_new_page.dart';
import 'package:trip_planner/presentation/shopping/pages/home/shopping_home_page.dart';
import 'package:trip_planner/presentation/shopping/pages/new/shopping_new_item_page.dart';
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
  static const shoppingHome = "/Shopping";
  static const shoppingNewItem = "/Shopping/item/new";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.tripList:
        return _page((_) => TripListPage());
      case Routes.tripNew:
        return _page((_) => TripNewPage());
      case Routes.tripDetails:
        if (args is int) return _page((_) => TripDetailsPage(tripId: args));
        return _error("TripDetailsPage requires tripId");
      case Routes.tripEdit:
        if (args is int)
          return _page((_) => TripEditPage(
                tripId: args,
                tripByIdCubit: dependencies(),
                updateCommandHandler: dependencies(),
              ));
        return _error("TripEditPage requires tripId");
      case Routes.budgetHome:
        if (args is int)
          return _page(
              (_) => BudgetHomePage(tripId: args, cubit: dependencies()));
        return _error("BudgetHomePage requires tripId");
      case Routes.budgetNew:
        if (args is int) {
          return _page((_) =>
              BudgetNewPage(tripId: args, commandHandler: dependencies()));
        }
        return _error("BudgetNewPage requires tripId");
      case Routes.shoppingHome:
        if (args is int) {
          return _page((_) => ShoppingHomePage(tripId: args));
        }
        return _error("ShoppingHomePage requires tripId");

      case Routes.shoppingNewItem:
        if (args is int) {
          return _page((_) => ShoppingNewItemPage(tripId: args, commandHandler: dependencies(),));
        }
        return _error("ShoppingHomePage requires tripId");
    }
    return _error("Unknown route: ${settings.name}");
  }

  static MaterialPageRoute<dynamic> _error(String message) {
    return _page((_) => _ErrorPage(message: message));
  }

  static MaterialPageRoute<dynamic> _page(WidgetBuilder builder) {
    return MaterialPageRoute(builder: builder);
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
