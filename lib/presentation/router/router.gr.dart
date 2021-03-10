// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../trip/list/ui/trip_home_page.dart';

class Routes {
  static const String tripListPage = '/';
  static const all = <String>{
    tripListPage,
  };
}

class AutomaticRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.tripListPage, page: TripListPage),
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
  };
}
