// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:auto_route/empty_router_widgets.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i15;
import 'package:flutter/material.dart' as _i13;

import 'common/user_auth_guard.dart' as _i14;
import 'common/web_view_page.dart' as _i2;
import 'feature/asset/asset_page.dart' as _i9;
import 'feature/asset/deposit_page.dart' as _i3;
import 'feature/asset/record_detail_page.dart' as _i5;
import 'feature/asset/withdraw_page.dart' as _i4;
import 'feature/home/home_page.dart' as _i7;
import 'feature/remote/remote_page.dart' as _i8;
import 'feature/user_auth/login_page.dart' as _i10;
import 'feature/user_auth/register_page.dart' as _i11;
import 'tab_page.dart' as _i1;

class AppRouter extends _i12.RootStackRouter {
  AppRouter({
    _i13.GlobalKey<_i13.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i14.AuthGuard authGuard;

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.TabPage(),
      );
    },
    WebViewRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewRouteArgs>();
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i2.WebViewPage(
          key: args.key,
          url: args.url,
        ),
      );
    },
    DepositRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DepositPage(),
      );
    },
    WithdrawRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i4.WithdrawPage(),
      );
    },
    RecordDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RecordDetailRouteArgs>(
          orElse: () => RecordDetailRouteArgs(id: pathParams.getInt('id')));
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i5.RecordDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    UserAuthRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
        fullscreenDialog: true,
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    RemoteRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i8.RemotePage(),
      );
    },
    AssetRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AssetPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i10.LoginPage(
          key: args.key,
          onLoginSuccess: args.onLoginSuccess,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i11.RegisterPage(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          TabRoute.name,
          path: '/',
          children: [
            _i12.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: TabRoute.name,
            ),
            _i12.RouteConfig(
              RemoteRoute.name,
              path: 'remote-page',
              parent: TabRoute.name,
            ),
            _i12.RouteConfig(
              AssetRoute.name,
              path: 'asset-page',
              parent: TabRoute.name,
            ),
          ],
        ),
        _i12.RouteConfig(
          WebViewRoute.name,
          path: '/web-view-page',
        ),
        _i12.RouteConfig(
          DepositRoute.name,
          path: '/deposit-page',
          guards: [authGuard],
        ),
        _i12.RouteConfig(
          WithdrawRoute.name,
          path: '/withdraw-page',
          guards: [authGuard],
        ),
        _i12.RouteConfig(
          RecordDetailRoute.name,
          path: '/record-detail-page/:id',
          guards: [authGuard],
        ),
        _i12.RouteConfig(
          UserAuthRoute.name,
          path: 'user-auth-page',
          children: [
            _i12.RouteConfig(
              LoginRoute.name,
              path: '',
              parent: UserAuthRoute.name,
            ),
            _i12.RouteConfig(
              RegisterRoute.name,
              path: 'register-page',
              parent: UserAuthRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.TabPage]
class TabRoute extends _i12.PageRouteInfo<void> {
  const TabRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [_i2.WebViewPage]
class WebViewRoute extends _i12.PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    _i15.Key? key,
    required String url,
  }) : super(
          WebViewRoute.name,
          path: '/web-view-page',
          args: WebViewRouteArgs(
            key: key,
            url: url,
          ),
        );

  static const String name = 'WebViewRoute';
}

class WebViewRouteArgs {
  const WebViewRouteArgs({
    this.key,
    required this.url,
  });

  final _i15.Key? key;

  final String url;

  @override
  String toString() {
    return 'WebViewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i3.DepositPage]
class DepositRoute extends _i12.PageRouteInfo<void> {
  const DepositRoute()
      : super(
          DepositRoute.name,
          path: '/deposit-page',
        );

  static const String name = 'DepositRoute';
}

/// generated route for
/// [_i4.WithdrawPage]
class WithdrawRoute extends _i12.PageRouteInfo<void> {
  const WithdrawRoute()
      : super(
          WithdrawRoute.name,
          path: '/withdraw-page',
        );

  static const String name = 'WithdrawRoute';
}

/// generated route for
/// [_i5.RecordDetailPage]
class RecordDetailRoute extends _i12.PageRouteInfo<RecordDetailRouteArgs> {
  RecordDetailRoute({
    _i15.Key? key,
    required int id,
  }) : super(
          RecordDetailRoute.name,
          path: '/record-detail-page/:id',
          args: RecordDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'RecordDetailRoute';
}

class RecordDetailRouteArgs {
  const RecordDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i15.Key? key;

  final int id;

  @override
  String toString() {
    return 'RecordDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.EmptyRouterPage]
class UserAuthRoute extends _i12.PageRouteInfo<void> {
  const UserAuthRoute({List<_i12.PageRouteInfo>? children})
      : super(
          UserAuthRoute.name,
          path: 'user-auth-page',
          initialChildren: children,
        );

  static const String name = 'UserAuthRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.RemotePage]
class RemoteRoute extends _i12.PageRouteInfo<void> {
  const RemoteRoute()
      : super(
          RemoteRoute.name,
          path: 'remote-page',
        );

  static const String name = 'RemoteRoute';
}

/// generated route for
/// [_i9.AssetPage]
class AssetRoute extends _i12.PageRouteInfo<void> {
  const AssetRoute()
      : super(
          AssetRoute.name,
          path: 'asset-page',
        );

  static const String name = 'AssetRoute';
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i15.Key? key,
    void Function()? onLoginSuccess,
  }) : super(
          LoginRoute.name,
          path: '',
          args: LoginRouteArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onLoginSuccess,
  });

  final _i15.Key? key;

  final void Function()? onLoginSuccess;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register-page',
        );

  static const String name = 'RegisterRoute';
}
