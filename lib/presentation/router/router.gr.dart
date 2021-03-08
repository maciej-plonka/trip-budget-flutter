// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/trip/trip_home_page.dart';

class Routes {
  static const String tripHomePage = '/';
  static const all = <String>{
    tripHomePage,
  };
}

class AutomaticRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.tripHomePage, page: TripHomePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    TripHomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TripHomePage(),
        settings: data,
      );
    },
  };
}
