// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../trip/list/ui/trip_list_page.dart';
import '../trip/new/ui/trip_new_page.dart';

class Routes {
  static const String tripListPage = '/';
  static const String tripNewPage = '/trip-new-page';
  static const all = <String>{
    tripListPage,
    tripNewPage,
  };
}

class AutomaticRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.tripListPage, page: TripListPage),
    RouteDef(Routes.tripNewPage, page: TripNewPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    TripListPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TripListPage(),
        settings: data,
      );
    },
    TripNewPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TripNewPage(),
        settings: data,
      );
    },
  };
}
