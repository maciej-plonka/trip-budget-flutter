import 'package:auto_route/auto_route.dart';
import 'package:trip_planner/presentation/budget/pages/budget_page.dart';
import 'package:trip_planner/presentation/budget/pages/home/budget_home_page.dart';
import 'package:trip_planner/presentation/budget/pages/new/budget_new_page.dart';
import 'package:trip_planner/presentation/shopping/pages/home/shopping_home_page.dart';
import 'package:trip_planner/presentation/shopping/pages/new/shopping_new_item_page.dart';
import 'package:trip_planner/presentation/shopping/pages/shopping_page.dart';
import 'package:trip_planner/presentation/trip/pages/details/trip_details_page.dart';
import 'package:trip_planner/presentation/trip/pages/edit/trip_edit_page.dart';
import 'package:trip_planner/presentation/trip/pages/list/trip_list_page.dart';
import 'package:trip_planner/presentation/trip/pages/new/trip_new_page.dart';
import 'package:trip_planner/presentation/trip/trip_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: TripPage,
      children: [
        AutoRoute(path: '', page: TripListPage),
        AutoRoute(path: 'new', page: TripNewPage),
        AutoRoute(path: ':tripId', page: TripDetailsPage),
        AutoRoute(path: ':tripId/edit', page: TripEditPage),
      ]
    ),
    AutoRoute(
      path: '/budget/:tripId',
      page: BudgetPage,
      children: [
        AutoRoute(path: '', page: BudgetHomePage),
        AutoRoute(path: 'new', page: BudgetNewPage),
      ]
    ),
    AutoRoute(
        path: '/shopping/:tripId',
        page: ShoppingPage,
        children: [
          AutoRoute(path: '', page: ShoppingHomePage),
          AutoRoute(path: 'new', page: ShoppingNewItemPage),
        ]
    )
  ]
)
class $AppRouter {}