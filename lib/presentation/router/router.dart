
import 'package:auto_route/auto_route_annotations.dart';
import 'package:trip_planner/presentation/trip/list/ui/trip_home_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: TripListPage, initial: true),
  ],
)
class $AutomaticRouter {}
