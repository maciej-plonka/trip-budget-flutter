
import 'package:auto_route/auto_route_annotations.dart';
import 'package:trip_planner/presentation/pages/trip/trip_home_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: TripHomePage, initial: true),
  ],
)
class $AutomaticRouter {}
