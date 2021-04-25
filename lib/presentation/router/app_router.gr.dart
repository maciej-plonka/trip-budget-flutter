// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/widgets.dart' as _i13;

import '../../domain/shopping/commands/item/create/shopping_item_create_command_handler.dart'
    as _i18;
import '../../domain/trip/commands/update/trip_update_command_handler.dart'
    as _i15;
import '../budget/bloc/budget_by_trip_id/budget_by_trip_id_cubit.dart' as _i16;
import '../budget/pages/budget_page.dart' as _i3;
import '../budget/pages/home/budget_home_page.dart' as _i9;
import '../budget/pages/new/budget_new_page.dart' as _i10;
import '../shopping/bloc/filtered_search_cubit/shopping_filtered_search_cubit.dart'
    as _i17;
import '../shopping/pages/home/shopping_home_page.dart' as _i11;
import '../shopping/pages/new/shopping_new_item_page.dart' as _i12;
import '../shopping/pages/shopping_page.dart' as _i4;
import '../trip/bloc/trip_by_id/trip_by_id_cubit.dart' as _i14;
import '../trip/pages/details/trip_details_page.dart' as _i7;
import '../trip/pages/edit/trip_edit_page.dart' as _i8;
import '../trip/pages/list/trip_list_page.dart' as _i5;
import '../trip/pages/new/trip_new_page.dart' as _i6;
import '../trip/trip_page.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    TripRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.TripPage());
    },
    BudgetRoute.name: (entry) {
      var pathParams = entry.routeData.pathParams;
      var args = entry.routeData.argsAs<BudgetRouteArgs>(
          orElse: () => BudgetRouteArgs(tripId: pathParams.getInt('tripId')));
      return _i1.MaterialPageX(
          entry: entry,
          child: _i3.BudgetPage(key: args.key, tripId: args.tripId));
    },
    ShoppingRoute.name: (entry) {
      var pathParams = entry.routeData.pathParams;
      var args = entry.routeData.argsAs<ShoppingRouteArgs>(
          orElse: () => ShoppingRouteArgs(tripId: pathParams.getInt('tripId')));
      return _i1.MaterialPageX(
          entry: entry,
          child: _i4.ShoppingPage(key: args.key, tripId: args.tripId));
    },
    TripListRoute.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.TripListPage());
    },
    TripNewRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<TripNewRouteArgs>(orElse: () => TripNewRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i6.TripNewPage(key: args.key, onCreated: args.onCreated));
    },
    TripDetailsRoute.name: (entry) {
      var pathParams = entry.routeData.pathParams;
      var args = entry.routeData.argsAs<TripDetailsRouteArgs>(
          orElse: () =>
              TripDetailsRouteArgs(tripId: pathParams.getInt('tripId')));
      return _i1.MaterialPageX(
          entry: entry,
          child: _i7.TripDetailsPage(key: args.key, tripId: args.tripId));
    },
    TripEditRoute.name: (entry) {
      var pathParams = entry.routeData.pathParams;
      var args = entry.routeData.argsAs<TripEditRouteArgs>(
          orElse: () => TripEditRouteArgs(tripId: pathParams.getInt('tripId')));
      return _i1.MaterialPageX(
          entry: entry,
          child: _i8.TripEditPage(
              key: args.key,
              tripId: args.tripId,
              cubit: args.cubit,
              updateCommandHandler: args.updateCommandHandler,
              onEdited: args.onEdited));
    },
    BudgetHomeRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<BudgetHomeRouteArgs>(orElse: () => BudgetHomeRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i9.BudgetHomePage(tripId: args.tripId, cubit: args.cubit));
    },
    BudgetNewRoute.name: (entry) {
      var args = entry.routeData.argsAs<BudgetNewRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i10.BudgetNewPage(
              tripId: args.tripId,
              commandHandler: args.commandHandler,
              onCreated: args.onCreated));
    },
    ShoppingHomeRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<ShoppingHomeRouteArgs>(orElse: () => ShoppingHomeRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i11.ShoppingHomePage(
              key: args.key, tripId: args.tripId, cubit: args.cubit));
    },
    ShoppingNewItemRoute.name: (entry) {
      var args = entry.routeData.argsAs<ShoppingNewItemRouteArgs>();
      return _i1.MaterialPageX(
          entry: entry,
          child: _i12.ShoppingNewItemPage(
              key: args.key,
              tripId: args.tripId,
              commandHandler: args.commandHandler,
              onCreated: args.onCreated));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(TripRoute.name, path: '/', children: [
          _i1.RouteConfig(TripListRoute.name, path: ''),
          _i1.RouteConfig(TripNewRoute.name, path: 'new'),
          _i1.RouteConfig(TripDetailsRoute.name, path: ':tripId'),
          _i1.RouteConfig(TripEditRoute.name, path: ':tripId/edit')
        ]),
        _i1.RouteConfig(BudgetRoute.name, path: '/budget/:tripId', children: [
          _i1.RouteConfig(BudgetHomeRoute.name, path: ''),
          _i1.RouteConfig(BudgetNewRoute.name, path: 'new')
        ]),
        _i1.RouteConfig(ShoppingRoute.name,
            path: '/shopping/:tripId',
            children: [
              _i1.RouteConfig(ShoppingHomeRoute.name, path: ''),
              _i1.RouteConfig(ShoppingNewItemRoute.name, path: 'new')
            ])
      ];
}

class TripRoute extends _i1.PageRouteInfo {
  const TripRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'TripRoute';
}

class BudgetRoute extends _i1.PageRouteInfo<BudgetRouteArgs> {
  BudgetRoute(
      {_i13.Key? key, required int tripId, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: '/budget/:tripId',
            args: BudgetRouteArgs(key: key, tripId: tripId),
            params: {'tripId': tripId},
            initialChildren: children);

  static const String name = 'BudgetRoute';
}

class BudgetRouteArgs {
  const BudgetRouteArgs({this.key, required this.tripId});

  final _i13.Key? key;

  final int tripId;
}

class ShoppingRoute extends _i1.PageRouteInfo<ShoppingRouteArgs> {
  ShoppingRoute(
      {_i13.Key? key, required int tripId, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: '/shopping/:tripId',
            args: ShoppingRouteArgs(key: key, tripId: tripId),
            params: {'tripId': tripId},
            initialChildren: children);

  static const String name = 'ShoppingRoute';
}

class ShoppingRouteArgs {
  const ShoppingRouteArgs({this.key, required this.tripId});

  final _i13.Key? key;

  final int tripId;
}

class TripListRoute extends _i1.PageRouteInfo {
  const TripListRoute() : super(name, path: '');

  static const String name = 'TripListRoute';
}

class TripNewRoute extends _i1.PageRouteInfo<TripNewRouteArgs> {
  TripNewRoute({_i13.Key? key, void Function()? onCreated})
      : super(name,
            path: 'new',
            args: TripNewRouteArgs(key: key, onCreated: onCreated));

  static const String name = 'TripNewRoute';
}

class TripNewRouteArgs {
  const TripNewRouteArgs({this.key, this.onCreated});

  final _i13.Key? key;

  final void Function()? onCreated;
}

class TripDetailsRoute extends _i1.PageRouteInfo<TripDetailsRouteArgs> {
  TripDetailsRoute({_i13.Key? key, required int tripId})
      : super(name,
            path: ':tripId',
            args: TripDetailsRouteArgs(key: key, tripId: tripId),
            params: {'tripId': tripId});

  static const String name = 'TripDetailsRoute';
}

class TripDetailsRouteArgs {
  const TripDetailsRouteArgs({this.key, required this.tripId});

  final _i13.Key? key;

  final int tripId;
}

class TripEditRoute extends _i1.PageRouteInfo<TripEditRouteArgs> {
  TripEditRoute(
      {_i13.Key? key,
      required int tripId,
      _i14.TripByIdCubit? cubit,
      _i15.TripUpdateCommandHandler? updateCommandHandler,
      void Function()? onEdited})
      : super(name,
            path: ':tripId/edit',
            args: TripEditRouteArgs(
                key: key,
                tripId: tripId,
                cubit: cubit,
                updateCommandHandler: updateCommandHandler,
                onEdited: onEdited),
            params: {'tripId': tripId});

  static const String name = 'TripEditRoute';
}

class TripEditRouteArgs {
  const TripEditRouteArgs(
      {this.key,
      required this.tripId,
      this.cubit,
      this.updateCommandHandler,
      this.onEdited});

  final _i13.Key? key;

  final int tripId;

  final _i14.TripByIdCubit? cubit;

  final _i15.TripUpdateCommandHandler? updateCommandHandler;

  final void Function()? onEdited;
}

class BudgetHomeRoute extends _i1.PageRouteInfo<BudgetHomeRouteArgs> {
  BudgetHomeRoute({int? tripId, _i16.BudgetByTripIdCubit? cubit})
      : super(name,
            path: '', args: BudgetHomeRouteArgs(tripId: tripId, cubit: cubit));

  static const String name = 'BudgetHomeRoute';
}

class BudgetHomeRouteArgs {
  const BudgetHomeRouteArgs({this.tripId, this.cubit});

  final int? tripId;

  final _i16.BudgetByTripIdCubit? cubit;
}

class BudgetNewRoute extends _i1.PageRouteInfo<BudgetNewRouteArgs> {
  BudgetNewRoute(
      {required int tripId, dynamic commandHandler, void Function()? onCreated})
      : super(name,
            path: 'new',
            args: BudgetNewRouteArgs(
                tripId: tripId,
                commandHandler: commandHandler,
                onCreated: onCreated));

  static const String name = 'BudgetNewRoute';
}

class BudgetNewRouteArgs {
  const BudgetNewRouteArgs(
      {required this.tripId, this.commandHandler, this.onCreated});

  final int tripId;

  final dynamic commandHandler;

  final void Function()? onCreated;
}

class ShoppingHomeRoute extends _i1.PageRouteInfo<ShoppingHomeRouteArgs> {
  ShoppingHomeRoute(
      {_i13.Key? key, int? tripId, _i17.ShoppingFilteredSearchCubit? cubit})
      : super(name,
            path: '',
            args:
                ShoppingHomeRouteArgs(key: key, tripId: tripId, cubit: cubit));

  static const String name = 'ShoppingHomeRoute';
}

class ShoppingHomeRouteArgs {
  const ShoppingHomeRouteArgs({this.key, this.tripId, this.cubit});

  final _i13.Key? key;

  final int? tripId;

  final _i17.ShoppingFilteredSearchCubit? cubit;
}

class ShoppingNewItemRoute extends _i1.PageRouteInfo<ShoppingNewItemRouteArgs> {
  ShoppingNewItemRoute(
      {_i13.Key? key,
      required int tripId,
      _i18.ShoppingItemCreateCommandHandler? commandHandler,
      void Function()? onCreated})
      : super(name,
            path: 'new',
            args: ShoppingNewItemRouteArgs(
                key: key,
                tripId: tripId,
                commandHandler: commandHandler,
                onCreated: onCreated));

  static const String name = 'ShoppingNewItemRoute';
}

class ShoppingNewItemRouteArgs {
  const ShoppingNewItemRouteArgs(
      {this.key, required this.tripId, this.commandHandler, this.onCreated});

  final _i13.Key? key;

  final int tripId;

  final _i18.ShoppingItemCreateCommandHandler? commandHandler;

  final void Function()? onCreated;
}
