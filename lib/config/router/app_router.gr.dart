// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/screens/login_screen1.dart'
    as _i8;
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/presentation/screen/get_loan_flow_annuities_detail_data_for_credit_screen.dart'
    as _i7;
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/presentation/screen/get_list_dpf_digital_solicitation_screen.dart'
    as _i5;
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/bloc/get_parameters_to_digital_dpf_bloc.dart'
    as _i24;
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/screen/get_parameters_to_digital_dpf_screen.dart'
    as _i9;
import 'package:app_prodem_v1/modules/home/GetAccountBalances/presentation/bloc/bloc.dart'
    as _i19;
import 'package:app_prodem_v1/modules/home/GetAccountBalances/presentation/screen/account_balances_screen.dart'
    as _i1;
import 'package:app_prodem_v1/modules/home/savingsAccountExtractDataTransactionable/presentation/bloc/saving_account_extrac_bloc.dart'
    as _i25;
import 'package:app_prodem_v1/modules/home/savingsAccountExtractDataTransactionable/presentation/screen/saving_account_extrac_data_tran_screen.dart'
    as _i12;
import 'package:app_prodem_v1/modules/home/settings_screen/get_account_enabled_to_transfer/presentation/screen/get_account_enabled_to_transfer_screen.dart'
    as _i11;
import 'package:app_prodem_v1/modules/home/settings_screen/settings_screen.dart'
    as _i14;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc.dart'
    as _i23;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart'
    as _i20;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/home.screen.dart'
    as _i6;
import 'package:app_prodem_v1/modules/key_pr/presentation/screen/saving_account_data_key_screen.dart'
    as _i15;
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressData/presentation/bloc/express_data_bloc.dart'
    as _i21;
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressData/presentation/screen/express_data_screen.dart'
    as _i2;
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/presentation/screen/pr_express_solicitation_web_sceen.dart'
    as _i10;
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/bloc/saving_account_data_bloc.dart'
    as _i27;
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/screen/saving_account_data_screen.dart'
    as _i16;
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/entity.dart'
    as _i26;
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/presentation/screen/saving_account_transfer_mobile_screen.dart'
    as _i13;
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/presentation/bloc/get_ach_banck_bloc.dart'
    as _i22;
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/presentation/screen/get_ach_banck_list_screen.dart'
    as _i3;
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/presentation/screen/get_ach_data_screen.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

/// generated route for
/// [_i1.AccountInquiryScreen]
class AccountInquiryRoute extends _i17.PageRouteInfo<AccountInquiryRouteArgs> {
  AccountInquiryRoute({
    _i18.Key? key,
    required _i19.AccountBalanceBloc bloc,
    required _i20.SessionInfoBloc sessionBloc,
    List<_i17.PageRouteInfo>? children,
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

  static _i17.PageInfo page = _i17.PageInfo(
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

  final _i18.Key? key;

  final _i19.AccountBalanceBloc bloc;

  final _i20.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'AccountInquiryRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i2.ExpressDataScreen]
class ExpressDataRoute extends _i17.PageRouteInfo<ExpressDataRouteArgs> {
  ExpressDataRoute({
    _i18.Key? key,
    required _i21.ExpressDataBloc bloc,
    required _i20.SessionInfoBloc sessionBloc,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         ExpressDataRoute.name,
         args: ExpressDataRouteArgs(
           key: key,
           bloc: bloc,
           sessionBloc: sessionBloc,
         ),
         initialChildren: children,
       );

  static const String name = 'ExpressDataRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExpressDataRouteArgs>();
      return _i2.ExpressDataScreen(
        key: args.key,
        bloc: args.bloc,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class ExpressDataRouteArgs {
  const ExpressDataRouteArgs({
    this.key,
    required this.bloc,
    required this.sessionBloc,
  });

  final _i18.Key? key;

  final _i21.ExpressDataBloc bloc;

  final _i20.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'ExpressDataRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i3.GetAchBanckListScreen]
class GetAchBanckListRoute
    extends _i17.PageRouteInfo<GetAchBanckListRouteArgs> {
  GetAchBanckListRoute({
    _i18.Key? key,
    required _i22.GetAchBanckBloc bloc,
    required _i23.SessionInfoBloc sessionBloc,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         GetAchBanckListRoute.name,
         args: GetAchBanckListRouteArgs(
           key: key,
           bloc: bloc,
           sessionBloc: sessionBloc,
         ),
         initialChildren: children,
       );

  static const String name = 'GetAchBanckListRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GetAchBanckListRouteArgs>();
      return _i3.GetAchBanckListScreen(
        key: args.key,
        bloc: args.bloc,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class GetAchBanckListRouteArgs {
  const GetAchBanckListRouteArgs({
    this.key,
    required this.bloc,
    required this.sessionBloc,
  });

  final _i18.Key? key;

  final _i22.GetAchBanckBloc bloc;

  final _i23.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'GetAchBanckListRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i4.GetAchDataScreen]
class GetAchDataRoute extends _i17.PageRouteInfo<GetAchDataRouteArgs> {
  GetAchDataRoute({
    _i18.Key? key,
    required String bancoDes,
    required String cambioM,
    required String cuentaDes,
    required String cuentaO,
    required String mComision,
    required String montoDev,
    required String montoEn,
    required String montoIm,
    required String montoTotal,
    required String motivoEn,
    required String nit,
    required String nombreDes,
    required String idBankDestiny,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         GetAchDataRoute.name,
         args: GetAchDataRouteArgs(
           key: key,
           bancoDes: bancoDes,
           cambioM: cambioM,
           cuentaDes: cuentaDes,
           cuentaO: cuentaO,
           mComision: mComision,
           montoDev: montoDev,
           montoEn: montoEn,
           montoIm: montoIm,
           montoTotal: montoTotal,
           motivoEn: motivoEn,
           nit: nit,
           nombreDes: nombreDes,
           idBankDestiny: idBankDestiny,
         ),
         initialChildren: children,
       );

  static const String name = 'GetAchDataRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GetAchDataRouteArgs>();
      return _i4.GetAchDataScreen(
        key: args.key,
        bancoDes: args.bancoDes,
        cambioM: args.cambioM,
        cuentaDes: args.cuentaDes,
        cuentaO: args.cuentaO,
        mComision: args.mComision,
        montoDev: args.montoDev,
        montoEn: args.montoEn,
        montoIm: args.montoIm,
        montoTotal: args.montoTotal,
        motivoEn: args.motivoEn,
        nit: args.nit,
        nombreDes: args.nombreDes,
        idBankDestiny: args.idBankDestiny,
      );
    },
  );
}

class GetAchDataRouteArgs {
  const GetAchDataRouteArgs({
    this.key,
    required this.bancoDes,
    required this.cambioM,
    required this.cuentaDes,
    required this.cuentaO,
    required this.mComision,
    required this.montoDev,
    required this.montoEn,
    required this.montoIm,
    required this.montoTotal,
    required this.motivoEn,
    required this.nit,
    required this.nombreDes,
    required this.idBankDestiny,
  });

  final _i18.Key? key;

  final String bancoDes;

  final String cambioM;

  final String cuentaDes;

  final String cuentaO;

  final String mComision;

  final String montoDev;

  final String montoEn;

  final String montoIm;

  final String montoTotal;

  final String motivoEn;

  final String nit;

  final String nombreDes;

  final String idBankDestiny;

  @override
  String toString() {
    return 'GetAchDataRouteArgs{key: $key, bancoDes: $bancoDes, cambioM: $cambioM, cuentaDes: $cuentaDes, cuentaO: $cuentaO, mComision: $mComision, montoDev: $montoDev, montoEn: $montoEn, montoIm: $montoIm, montoTotal: $montoTotal, motivoEn: $motivoEn, nit: $nit, nombreDes: $nombreDes, idBankDestiny: $idBankDestiny}';
  }
}

/// generated route for
/// [_i5.GetListDpfDigitalSolicitationScreen]
class GetListDpfDigitalSolicitationRoute extends _i17.PageRouteInfo<void> {
  const GetListDpfDigitalSolicitationRoute({List<_i17.PageRouteInfo>? children})
    : super(GetListDpfDigitalSolicitationRoute.name, initialChildren: children);

  static const String name = 'GetListDpfDigitalSolicitationRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i5.GetListDpfDigitalSolicitationScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i7.LoanFlowAnnuitiesDetailDataForCreditScreen]
class LoanFlowAnnuitiesDetailDataForCreditRoute
    extends _i17.PageRouteInfo<void> {
  const LoanFlowAnnuitiesDetailDataForCreditRoute({
    List<_i17.PageRouteInfo>? children,
  }) : super(
         LoanFlowAnnuitiesDetailDataForCreditRoute.name,
         initialChildren: children,
       );

  static const String name = 'LoanFlowAnnuitiesDetailDataForCreditRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoanFlowAnnuitiesDetailDataForCreditScreen();
    },
  );
}

/// generated route for
/// [_i8.LoginScreen1]
class LoginRoute1 extends _i17.PageRouteInfo<void> {
  const LoginRoute1({List<_i17.PageRouteInfo>? children})
    : super(LoginRoute1.name, initialChildren: children);

  static const String name = 'LoginRoute1';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoginScreen1();
    },
  );
}

/// generated route for
/// [_i9.ParametersToDigitalDpfScreen]
class ParametersToDigitalDpfRoute
    extends _i17.PageRouteInfo<ParametersToDigitalDpfRouteArgs> {
  ParametersToDigitalDpfRoute({
    _i18.Key? key,
    required _i23.SessionInfoBloc sessioninfo,
    required _i24.GetParametersToDigitalDpfBloc bloc,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         ParametersToDigitalDpfRoute.name,
         args: ParametersToDigitalDpfRouteArgs(
           key: key,
           sessioninfo: sessioninfo,
           bloc: bloc,
         ),
         initialChildren: children,
       );

  static const String name = 'ParametersToDigitalDpfRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ParametersToDigitalDpfRouteArgs>();
      return _i9.ParametersToDigitalDpfScreen(
        key: args.key,
        sessioninfo: args.sessioninfo,
        bloc: args.bloc,
      );
    },
  );
}

class ParametersToDigitalDpfRouteArgs {
  const ParametersToDigitalDpfRouteArgs({
    this.key,
    required this.sessioninfo,
    required this.bloc,
  });

  final _i18.Key? key;

  final _i23.SessionInfoBloc sessioninfo;

  final _i24.GetParametersToDigitalDpfBloc bloc;

  @override
  String toString() {
    return 'ParametersToDigitalDpfRouteArgs{key: $key, sessioninfo: $sessioninfo, bloc: $bloc}';
  }
}

/// generated route for
/// [_i10.PrExpressSolicitationWebScreen]
class PrExpressSolicitationWebRoute
    extends _i17.PageRouteInfo<PrExpressSolicitationWebRouteArgs> {
  PrExpressSolicitationWebRoute({
    _i18.Key? key,
    required List<String> listCodeSavingsAccount,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         PrExpressSolicitationWebRoute.name,
         args: PrExpressSolicitationWebRouteArgs(
           key: key,
           listCodeSavingsAccount: listCodeSavingsAccount,
         ),
         initialChildren: children,
       );

  static const String name = 'PrExpressSolicitationWebRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrExpressSolicitationWebRouteArgs>();
      return _i10.PrExpressSolicitationWebScreen(
        key: args.key,
        listCodeSavingsAccount: args.listCodeSavingsAccount,
      );
    },
  );
}

class PrExpressSolicitationWebRouteArgs {
  const PrExpressSolicitationWebRouteArgs({
    this.key,
    required this.listCodeSavingsAccount,
  });

  final _i18.Key? key;

  final List<String> listCodeSavingsAccount;

  @override
  String toString() {
    return 'PrExpressSolicitationWebRouteArgs{key: $key, listCodeSavingsAccount: $listCodeSavingsAccount}';
  }
}

/// generated route for
/// [_i11.ReceiveTransfersByCellPhoneNumberScreen]
class ReceiveTransfersByCellPhoneNumberRoute extends _i17.PageRouteInfo<void> {
  const ReceiveTransfersByCellPhoneNumberRoute({
    List<_i17.PageRouteInfo>? children,
  }) : super(
         ReceiveTransfersByCellPhoneNumberRoute.name,
         initialChildren: children,
       );

  static const String name = 'ReceiveTransfersByCellPhoneNumberRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i11.ReceiveTransfersByCellPhoneNumberScreen();
    },
  );
}

/// generated route for
/// [_i12.SavingAccountExtractDataTranSacreen]
class SavingAccountExtractDataTranSacreen
    extends _i17.PageRouteInfo<SavingAccountExtractDataTranSacreenArgs> {
  SavingAccountExtractDataTranSacreen({
    _i18.Key? key,
    required _i25.SavingAccountExtracBloc bloc,
    required _i23.SessionInfoBloc sessionBloc,
    List<_i17.PageRouteInfo>? children,
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingAccountExtractDataTranSacreenArgs>();
      return _i12.SavingAccountExtractDataTranSacreen(
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

  final _i18.Key? key;

  final _i25.SavingAccountExtracBloc bloc;

  final _i23.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'SavingAccountExtractDataTranSacreenArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i13.SavingAccountTransMobileEndScreen]
class SavingAccountTransMobileEndRoute
    extends _i17.PageRouteInfo<SavingAccountTransMobileEndRouteArgs> {
  SavingAccountTransMobileEndRoute({
    _i18.Key? key,
    required _i26.SavingsAccountTransferMobileResponseEntity response,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         SavingAccountTransMobileEndRoute.name,
         args: SavingAccountTransMobileEndRouteArgs(
           key: key,
           response: response,
         ),
         initialChildren: children,
       );

  static const String name = 'SavingAccountTransMobileEndRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingAccountTransMobileEndRouteArgs>();
      return _i13.SavingAccountTransMobileEndScreen(
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

  final _i18.Key? key;

  final _i26.SavingsAccountTransferMobileResponseEntity response;

  @override
  String toString() {
    return 'SavingAccountTransMobileEndRouteArgs{key: $key, response: $response}';
  }
}

/// generated route for
/// [_i14.SettingsScreen]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i14.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i15.TransferFeesTwoScreen]
class TransferFeesTwoRoute
    extends _i17.PageRouteInfo<TransferFeesTwoRouteArgs> {
  TransferFeesTwoRoute({
    _i18.Key? key,
    required String? cuentaO,
    required String? cuentaD,
    required String? monto,
    required String? saldo,
    required List<String>? titulares,
    List<_i17.PageRouteInfo>? children,
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

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransferFeesTwoRouteArgs>();
      return _i15.TransferFeesTwoScreen(
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

  final _i18.Key? key;

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
/// [_i16.TransferScreen]
class TransferRoute extends _i17.PageRouteInfo<TransferRouteArgs> {
  TransferRoute({
    _i18.Key? key,
    required _i27.SavingAccountDataBloc bloc,
    required _i23.SessionInfoBloc sessionBloc,
    required _i16.TransferType transferType,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         TransferRoute.name,
         args: TransferRouteArgs(
           key: key,
           bloc: bloc,
           sessionBloc: sessionBloc,
           transferType: transferType,
         ),
         initialChildren: children,
       );

  static const String name = 'TransferRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransferRouteArgs>();
      return _i16.TransferScreen(
        key: args.key,
        bloc: args.bloc,
        sessionBloc: args.sessionBloc,
        transferType: args.transferType,
      );
    },
  );
}

class TransferRouteArgs {
  const TransferRouteArgs({
    this.key,
    required this.bloc,
    required this.sessionBloc,
    required this.transferType,
  });

  final _i18.Key? key;

  final _i27.SavingAccountDataBloc bloc;

  final _i23.SessionInfoBloc sessionBloc;

  final _i16.TransferType transferType;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc, transferType: $transferType}';
  }
}
