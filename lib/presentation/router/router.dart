
import 'package:auto_route/auto_route_annotations.dart';
import 'package:trip_planner/presentation/trip/list/ui/trip_list_page.dart';
import 'package:trip_planner/presentation/trip/new/ui/trip_new_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: TripListPage, initial: true),
    MaterialRoute(page: TripNewPage)
  ],
)
class $AutomaticRouter {}
