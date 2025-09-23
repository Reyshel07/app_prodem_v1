// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/screens/login_screen1.dart'
    as _i3;
import 'package:app_prodem_v1/modules/home/GetAccountBalances/presentation/bloc/bloc.dart'
    as _i9;
import 'package:app_prodem_v1/modules/home/GetAccountBalances/presentation/screen/account_balances_screen.dart'
    as _i1;
import 'package:app_prodem_v1/modules/home/SavingsAccountExtractDataTransactionable/presentation/screen/saving_account_extrac_data_tran_screen.dart'
    as _i5;
import 'package:app_prodem_v1/modules/home/settings_screen/settings_screen.dart'
    as _i6;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart'
    as _i10;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/home.screen.dart'
    as _i2;
import 'package:app_prodem_v1/modules/transfer%20between%20accounts/GetSavingAccountData/presentation/screen/saving_account_data_screen.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.AccountInquiryScreen]
class AccountInquiryRoute extends _i7.PageRouteInfo<AccountInquiryRouteArgs> {
  AccountInquiryRoute({
    _i8.Key? key,
    required _i9.AccountBalanceBloc bloc,
    required _i10.SessionInfoBloc sessionBloc,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AccountInquiryRoute.name,
          args: AccountInquiryRouteArgs(
            key: key,
            bloc: bloc,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountInquiryRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AccountInquiryRouteArgs>();
      return _i1.AccountInquiryScreen(
        key: args.key,
        bloc: args.bloc,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class AccountInquiryRouteArgs {
  const AccountInquiryRouteArgs({
    this.key,
    required this.bloc,
    required this.sessionBloc,
  });

  final _i8.Key? key;

  final _i9.AccountBalanceBloc bloc;

  final _i10.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'AccountInquiryRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen1]
class LoginRoute1 extends _i7.PageRouteInfo<void> {
  const LoginRoute1({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute1.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute1';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen1();
    },
  );
}

/// generated route for
/// [_i4.SavingAccountDataScreen]
class SavingAccountDataRoute extends _i7.PageRouteInfo<void> {
  const SavingAccountDataRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SavingAccountDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavingAccountDataRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.SavingAccountDataScreen();
    },
  );
}

/// generated route for
/// [_i5.SavingAccountExtractDataTranSacreen]
class SavingAccountExtractDataTranSacreen extends _i7.PageRouteInfo<void> {
  const SavingAccountExtractDataTranSacreen({List<_i7.PageRouteInfo>? children})
      : super(
          SavingAccountExtractDataTranSacreen.name,
          initialChildren: children,
        );

  static const String name = 'SavingAccountExtractDataTranSacreen';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SavingAccountExtractDataTranSacreen();
    },
  );
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
    },
  );
}
