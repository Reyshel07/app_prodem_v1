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
    as _i12;
import 'package:app_prodem_v1/modules/home/GetAccountBalances/presentation/screen/account_balances_screen.dart'
    as _i1;
import 'package:app_prodem_v1/modules/home/SavingsAccountExtractDataTransactionable/presentation/bloc/saving_account_extrac_bloc.dart'
    as _i16;
import 'package:app_prodem_v1/modules/home/SavingsAccountExtractDataTransactionable/presentation/screen/saving_account_extrac_data_tran_screen.dart'
    as _i5;
import 'package:app_prodem_v1/modules/home/settings_screen/settings_screen.dart'
    as _i7;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc.dart'
    as _i15;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart'
    as _i13;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/home.screen.dart'
    as _i2;
import 'package:app_prodem_v1/modules/key_pr/presentation/screen/saving_account_data_key_screen.dart'
    as _i8;
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/bloc/saving_account_data_bloc.dart'
    as _i14;
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/screen/saving_account_data_screen.dart'
    as _i4;
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/screen/transfer_to_a_third_party_account_screen.dart'
    as _i9;
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/entity.dart'
    as _i17;
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/presentation/screen/saving_account_transfer_mobile_screen.dart'
    as _i6;
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.AccountInquiryScreen]
class AccountInquiryRoute extends _i10.PageRouteInfo<AccountInquiryRouteArgs> {
  AccountInquiryRoute({
    _i11.Key? key,
    required _i12.AccountBalanceBloc bloc,
    required _i13.SessionInfoBloc sessionBloc,
    List<_i10.PageRouteInfo>? children,
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

  static _i10.PageInfo page = _i10.PageInfo(
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

  final _i11.Key? key;

  final _i12.AccountBalanceBloc bloc;

  final _i13.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'AccountInquiryRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen1]
class LoginRoute1 extends _i10.PageRouteInfo<void> {
  const LoginRoute1({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute1.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute1';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen1();
    },
  );
}

/// generated route for
/// [_i4.SavingAccountDataScreen]
class SavingAccountDataRoute
    extends _i10.PageRouteInfo<SavingAccountDataRouteArgs> {
  SavingAccountDataRoute({
    _i11.Key? key,
    required _i14.SavingAccountDataBloc bloc,
    required _i15.SessionInfoBloc sessionBloc,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SavingAccountDataRoute.name,
          args: SavingAccountDataRouteArgs(
            key: key,
            bloc: bloc,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'SavingAccountDataRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingAccountDataRouteArgs>();
      return _i4.SavingAccountDataScreen(
        key: args.key,
        bloc: args.bloc,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class SavingAccountDataRouteArgs {
  const SavingAccountDataRouteArgs({
    this.key,
    required this.bloc,
    required this.sessionBloc,
  });

  final _i11.Key? key;

  final _i14.SavingAccountDataBloc bloc;

  final _i15.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'SavingAccountDataRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i5.SavingAccountExtractDataTranSacreen]
class SavingAccountExtractDataTranSacreen
    extends _i10.PageRouteInfo<SavingAccountExtractDataTranSacreenArgs> {
  SavingAccountExtractDataTranSacreen({
    _i11.Key? key,
    required _i16.SavingAccountExtracBloc bloc,
    required _i15.SessionInfoBloc sessionBloc,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SavingAccountExtractDataTranSacreen.name,
          args: SavingAccountExtractDataTranSacreenArgs(
            key: key,
            bloc: bloc,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'SavingAccountExtractDataTranSacreen';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingAccountExtractDataTranSacreenArgs>();
      return _i5.SavingAccountExtractDataTranSacreen(
        key: args.key,
        bloc: args.bloc,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class SavingAccountExtractDataTranSacreenArgs {
  const SavingAccountExtractDataTranSacreenArgs({
    this.key,
    required this.bloc,
    required this.sessionBloc,
  });

  final _i11.Key? key;

  final _i16.SavingAccountExtracBloc bloc;

  final _i15.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'SavingAccountExtractDataTranSacreenArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i6.SavingAccountTransMobileEndScreen]
class SavingAccountTransMobileEndRoute
    extends _i10.PageRouteInfo<SavingAccountTransMobileEndRouteArgs> {
  SavingAccountTransMobileEndRoute({
    _i11.Key? key,
    required _i17.SavingsAccountTransferMobileResponseEntity response,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SavingAccountTransMobileEndRoute.name,
          args: SavingAccountTransMobileEndRouteArgs(
            key: key,
            response: response,
          ),
          initialChildren: children,
        );

  static const String name = 'SavingAccountTransMobileEndRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingAccountTransMobileEndRouteArgs>();
      return _i6.SavingAccountTransMobileEndScreen(
        key: args.key,
        response: args.response,
      );
    },
  );
}

class SavingAccountTransMobileEndRouteArgs {
  const SavingAccountTransMobileEndRouteArgs({
    this.key,
    required this.response,
  });

  final _i11.Key? key;

  final _i17.SavingsAccountTransferMobileResponseEntity response;

  @override
  String toString() {
    return 'SavingAccountTransMobileEndRouteArgs{key: $key, response: $response}';
  }
}

/// generated route for
/// [_i7.SettingsScreen]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i8.TransferFeesTwoScreen]
class TransferFeesTwoRoute
    extends _i10.PageRouteInfo<TransferFeesTwoRouteArgs> {
  TransferFeesTwoRoute({
    _i11.Key? key,
    required String? cuentaO,
    required String? cuentaD,
    required String? monto,
    required String? saldo,
    required List<String>? titulares,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          TransferFeesTwoRoute.name,
          args: TransferFeesTwoRouteArgs(
            key: key,
            cuentaO: cuentaO,
            cuentaD: cuentaD,
            monto: monto,
            saldo: saldo,
            titulares: titulares,
          ),
          initialChildren: children,
        );

  static const String name = 'TransferFeesTwoRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransferFeesTwoRouteArgs>();
      return _i8.TransferFeesTwoScreen(
        key: args.key,
        cuentaO: args.cuentaO,
        cuentaD: args.cuentaD,
        monto: args.monto,
        saldo: args.saldo,
        titulares: args.titulares,
      );
    },
  );
}

class TransferFeesTwoRouteArgs {
  const TransferFeesTwoRouteArgs({
    this.key,
    required this.cuentaO,
    required this.cuentaD,
    required this.monto,
    required this.saldo,
    required this.titulares,
  });

  final _i11.Key? key;

  final String? cuentaO;

  final String? cuentaD;

  final String? monto;

  final String? saldo;

  final List<String>? titulares;

  @override
  String toString() {
    return 'TransferFeesTwoRouteArgs{key: $key, cuentaO: $cuentaO, cuentaD: $cuentaD, monto: $monto, saldo: $saldo, titulares: $titulares}';
  }
}

/// generated route for
/// [_i9.TransferToAThirdPartyAccountScreen]
class TransferToAThirdPartyAccountRoute
    extends _i10.PageRouteInfo<TransferToAThirdPartyAccountRouteArgs> {
  TransferToAThirdPartyAccountRoute({
    _i11.Key? key,
    required _i14.SavingAccountDataBloc bloc,
    required _i15.SessionInfoBloc sessionBloc,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          TransferToAThirdPartyAccountRoute.name,
          args: TransferToAThirdPartyAccountRouteArgs(
            key: key,
            bloc: bloc,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'TransferToAThirdPartyAccountRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransferToAThirdPartyAccountRouteArgs>();
      return _i9.TransferToAThirdPartyAccountScreen(
        key: args.key,
        bloc: args.bloc,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class TransferToAThirdPartyAccountRouteArgs {
  const TransferToAThirdPartyAccountRouteArgs({
    this.key,
    required this.bloc,
    required this.sessionBloc,
  });

  final _i11.Key? key;

  final _i14.SavingAccountDataBloc bloc;

  final _i15.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'TransferToAThirdPartyAccountRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}
