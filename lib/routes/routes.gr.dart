// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../pages/page.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    BookingRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BookingPage());
    },
    NearbyRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NearbyPage());
    },
    MessageRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MessagePage());
    },
    AccountRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AccountPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(MainRoute.name, path: '/', children: [
          _i2.RouteConfig(HomeRoute.name, path: 'home', parent: MainRoute.name),
          _i2.RouteConfig(BookingRoute.name,
              path: 'Booking', parent: MainRoute.name),
          _i2.RouteConfig(NearbyRoute.name,
              path: 'nearby', parent: MainRoute.name),
          _i2.RouteConfig(MessageRoute.name,
              path: 'message', parent: MainRoute.name),
          _i2.RouteConfig(AccountRoute.name,
              path: 'account', parent: MainRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i2.PageRouteInfo<void> {
  const MainRoute({List<_i2.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.BookingPage]
class BookingRoute extends _i2.PageRouteInfo<void> {
  const BookingRoute() : super(BookingRoute.name, path: 'Booking');

  static const String name = 'BookingRoute';
}

/// generated route for
/// [_i1.NearbyPage]
class NearbyRoute extends _i2.PageRouteInfo<void> {
  const NearbyRoute() : super(NearbyRoute.name, path: 'nearby');

  static const String name = 'NearbyRoute';
}

/// generated route for
/// [_i1.MessagePage]
class MessageRoute extends _i2.PageRouteInfo<void> {
  const MessageRoute() : super(MessageRoute.name, path: 'message');

  static const String name = 'MessageRoute';
}

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i2.PageRouteInfo<void> {
  const AccountRoute() : super(AccountRoute.name, path: 'account');

  static const String name = 'AccountRoute';
}
