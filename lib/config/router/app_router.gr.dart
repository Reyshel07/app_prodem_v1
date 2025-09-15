// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/screens/login_screen1.dart'
    as _i2;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/home.screen.dart'
    as _i1;
import 'package:auto_route/auto_route.dart' as _i3;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen1]
class LoginRoute1 extends _i3.PageRouteInfo<void> {
  const LoginRoute1({List<_i3.PageRouteInfo>? children})
    : super(LoginRoute1.name, initialChildren: children);

  static const String name = 'LoginRoute1';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen1();
    },
  );
}
