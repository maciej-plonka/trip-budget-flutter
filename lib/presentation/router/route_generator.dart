import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trip_planner/presentation/trip/list/ui/trip_list_page.dart';
import 'package:trip_planner/presentation/trip/new/ui/trip_new_page.dart';


class Routes {
  static const tripList = "/";
  static const tripNew = "/new";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.tripList:
        return MaterialPageRoute(builder: (_) => TripListPage());
      case Routes.tripNew:
        return MaterialPageRoute(builder: (_) => TripNewPage());
    }
    return MaterialPageRoute(
        builder: (_) => _ErrorPage(message: "Unknown route: ${settings.name}"));
  }
}


class _ErrorPage extends StatelessWidget {
  final String message;

  const _ErrorPage({Key key, @required this.message})
      : assert(message != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text("$message", style: TextStyle(
          color: Colors.red,
          fontStyle: FontStyle.italic
        ),),
      ),
    );
  }
}
