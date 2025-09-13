// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/screens/login_screen1.dart'
    as _i1;
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/screens/prueba.dart'
    as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.LoginScreen1]
class LoginRoute1 extends _i3.PageRouteInfo<void> {
  const LoginRoute1({List<_i3.PageRouteInfo>? children})
    : super(LoginRoute1.name, initialChildren: children);

  static const String name = 'LoginRoute1';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen1();
    },
  );
}

/// generated route for
/// [_i2.PruebaScreen]
class PruebaRoute extends _i3.PageRouteInfo<PruebaRouteArgs> {
  PruebaRoute({
    _i4.Key? key,
    required String text,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         PruebaRoute.name,
         args: PruebaRouteArgs(key: key, text: text),
         initialChildren: children,
       );

  static const String name = 'PruebaRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PruebaRouteArgs>();
      return _i2.PruebaScreen(key: args.key, text: args.text);
    },
  );
}

class PruebaRouteArgs {
  const PruebaRouteArgs({this.key, required this.text});

  final _i4.Key? key;

  final String text;

  @override
  String toString() {
    return 'PruebaRouteArgs{key: $key, text: $text}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PruebaRouteArgs) return false;
    return key == other.key && text == other.text;
  }

  @override
  int get hashCode => key.hashCode ^ text.hashCode;
}
