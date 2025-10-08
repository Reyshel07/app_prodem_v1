// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/screens/login_screen1.dart'
    as _i16;
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/presentation/screen/get_loan_flow_annuities_detail_data_for_credit_screen.dart'
    as _i14;
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/presentation/screen/loan_flow_get_credit_detail_data_for_recovery_screen.dart'
    as _i15;
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/presentation/screen/get_list_dpf_digital_solicitation_screen.dart'
    as _i11;
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/bloc/get_parameters_to_digital_dpf_bloc.dart'
    as _i35;
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/screen/get_parameters_to_digital_dpf_screen.dart'
    as _i17;
import 'package:app_prodem_v1/modules/dpf/InforAcciones/presentation/screen/administracion_screen.dart'
    as _i2;
import 'package:app_prodem_v1/modules/dpf/InforAcciones/presentation/screen/infor_accion_screenn.dart'
    as _i13;
import 'package:app_prodem_v1/modules/home/GetAccountBalances/presentation/bloc/bloc.dart'
    as _i28;
import 'package:app_prodem_v1/modules/home/GetAccountBalances/presentation/screen/account_balances_screen.dart'
    as _i1;
import 'package:app_prodem_v1/modules/home/savingsAccountExtractDataTransactionable/presentation/bloc/saving_account_extrac_bloc.dart'
    as _i36;
import 'package:app_prodem_v1/modules/home/savingsAccountExtractDataTransactionable/presentation/screen/saving_account_extrac_data_tran_screen.dart'
    as _i21;
import 'package:app_prodem_v1/modules/home/settings_screen/get_account_enabled_to_transfer/presentation/screen/get_account_enabled_to_transfer_screen.dart'
    as _i19;
import 'package:app_prodem_v1/modules/home/settings_screen/settings_screen.dart'
    as _i23;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc.dart'
    as _i34;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart'
    as _i29;
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/home.screen.dart'
    as _i12;
import 'package:app_prodem_v1/modules/key_pr/presentation/screen/saving_account_data_key_screen.dart'
    as _i24;
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressData/presentation/bloc/express_data_bloc.dart'
    as _i32;
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressData/presentation/screen/express_data_screen.dart'
    as _i7;
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/presentation/screen/pr_express_solicitation_web_sceen.dart'
    as _i18;
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/domain/entities/entity.dart'
    as _i30;
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/presentation/screen/decrypt_qr_details_screen.dart'
    as _i3;
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/presentation/screen/decrypt_qr_screen.dart'
    as _i4;
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/presentation/screen/decrypt_qr_string_screen.dart'
    as _i5;
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/domain/entities/entity.dart'
    as _i31;
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/presentation/screen/encripted_qr_screen.dart'
    as _i6;
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/presentation/screen/get_encripted_qr_string_screen.dart'
    as _i10;
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/presentation/screen/report_movement_by_person_and_date_screen.dart'
    as _i20;
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/bloc/saving_account_data_bloc.dart'
    as _i38;
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/presentation/screen/saving_account_data_screen.dart'
    as _i25;
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/entity.dart'
    as _i37;
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/presentation/screen/saving_account_transfer_mobile_screen.dart'
    as _i22;
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/presentation/bloc/get_ach_banck_bloc.dart'
    as _i33;
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/presentation/screen/get_ach_banck_list_screen.dart'
    as _i8;
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/presentation/screen/get_ach_data_screen.dart'
    as _i9;
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;

/// generated route for
/// [_i1.AccountInquiryScreen]
class AccountInquiryRoute extends _i26.PageRouteInfo<AccountInquiryRouteArgs> {
  AccountInquiryRoute({
    _i27.Key? key,
    required _i28.AccountBalanceBloc bloc,
    required _i29.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
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

  static _i26.PageInfo page = _i26.PageInfo(
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

  final _i27.Key? key;

  final _i28.AccountBalanceBloc bloc;

  final _i29.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'AccountInquiryRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i2.AdministracionScreen]
class AdministracionRoute extends _i26.PageRouteInfo<void> {
  const AdministracionRoute({List<_i26.PageRouteInfo>? children})
      : super(
          AdministracionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdministracionRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i2.AdministracionScreen();
    },
  );
}

/// generated route for
/// [_i3.DecryptQrDetailsScreen]
class DecryptQrDetailsRoute
    extends _i26.PageRouteInfo<DecryptQrDetailsRouteArgs> {
  DecryptQrDetailsRoute({
    _i27.Key? key,
    required String cuenta,
    required String saldo,
    required String monto,
    required String cambioMoneda,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          DecryptQrDetailsRoute.name,
          args: DecryptQrDetailsRouteArgs(
            key: key,
            cuenta: cuenta,
            saldo: saldo,
            monto: monto,
            cambioMoneda: cambioMoneda,
          ),
          initialChildren: children,
        );

  static const String name = 'DecryptQrDetailsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DecryptQrDetailsRouteArgs>();
      return _i3.DecryptQrDetailsScreen(
        key: args.key,
        cuenta: args.cuenta,
        saldo: args.saldo,
        monto: args.monto,
        cambioMoneda: args.cambioMoneda,
      );
    },
  );
}

class DecryptQrDetailsRouteArgs {
  const DecryptQrDetailsRouteArgs({
    this.key,
    required this.cuenta,
    required this.saldo,
    required this.monto,
    required this.cambioMoneda,
  });

  final _i27.Key? key;

  final String cuenta;

  final String saldo;

  final String monto;

  final String cambioMoneda;

  @override
  String toString() {
    return 'DecryptQrDetailsRouteArgs{key: $key, cuenta: $cuenta, saldo: $saldo, monto: $monto, cambioMoneda: $cambioMoneda}';
  }
}

/// generated route for
/// [_i4.DecryptQrScreen]
class DecryptQrRoute extends _i26.PageRouteInfo<DecryptQrRouteArgs> {
  DecryptQrRoute({
    _i27.Key? key,
    required _i30.DecryptQrStringEntity decryptQrStringEntity,
    required _i29.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          DecryptQrRoute.name,
          args: DecryptQrRouteArgs(
            key: key,
            decryptQrStringEntity: decryptQrStringEntity,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'DecryptQrRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DecryptQrRouteArgs>();
      return _i4.DecryptQrScreen(
        key: args.key,
        decryptQrStringEntity: args.decryptQrStringEntity,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class DecryptQrRouteArgs {
  const DecryptQrRouteArgs({
    this.key,
    required this.decryptQrStringEntity,
    required this.sessionBloc,
  });

  final _i27.Key? key;

  final _i30.DecryptQrStringEntity decryptQrStringEntity;

  final _i29.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'DecryptQrRouteArgs{key: $key, decryptQrStringEntity: $decryptQrStringEntity, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i5.DecryptQrStringScreen]
class DecryptQrStringRoute
    extends _i26.PageRouteInfo<DecryptQrStringRouteArgs> {
  DecryptQrStringRoute({
    _i27.Key? key,
    required _i29.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          DecryptQrStringRoute.name,
          args: DecryptQrStringRouteArgs(
            key: key,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'DecryptQrStringRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DecryptQrStringRouteArgs>();
      return _i5.DecryptQrStringScreen(
        key: args.key,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class DecryptQrStringRouteArgs {
  const DecryptQrStringRouteArgs({
    this.key,
    required this.sessionBloc,
  });

  final _i27.Key? key;

  final _i29.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'DecryptQrStringRouteArgs{key: $key, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i6.EncriptedQRScreen]
class EncriptedQRRoute extends _i26.PageRouteInfo<EncriptedQRRouteArgs> {
  EncriptedQRRoute({
    _i27.Key? key,
    required _i31.GetEncryptedQrStringEntity getEncryptedQrStringEntity,
    required String moneda,
    required String monto,
    required String referencia,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          EncriptedQRRoute.name,
          args: EncriptedQRRouteArgs(
            key: key,
            getEncryptedQrStringEntity: getEncryptedQrStringEntity,
            moneda: moneda,
            monto: monto,
            referencia: referencia,
          ),
          initialChildren: children,
        );

  static const String name = 'EncriptedQRRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EncriptedQRRouteArgs>();
      return _i6.EncriptedQRScreen(
        key: args.key,
        getEncryptedQrStringEntity: args.getEncryptedQrStringEntity,
        moneda: args.moneda,
        monto: args.monto,
        referencia: args.referencia,
      );
    },
  );
}

class EncriptedQRRouteArgs {
  const EncriptedQRRouteArgs({
    this.key,
    required this.getEncryptedQrStringEntity,
    required this.moneda,
    required this.monto,
    required this.referencia,
  });

  final _i27.Key? key;

  final _i31.GetEncryptedQrStringEntity getEncryptedQrStringEntity;

  final String moneda;

  final String monto;

  final String referencia;

  @override
  String toString() {
    return 'EncriptedQRRouteArgs{key: $key, getEncryptedQrStringEntity: $getEncryptedQrStringEntity, moneda: $moneda, monto: $monto, referencia: $referencia}';
  }
}

/// generated route for
/// [_i7.ExpressDataScreen]
class ExpressDataRoute extends _i26.PageRouteInfo<ExpressDataRouteArgs> {
  ExpressDataRoute({
    _i27.Key? key,
    required _i32.ExpressDataBloc bloc,
    required _i29.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
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

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExpressDataRouteArgs>();
      return _i7.ExpressDataScreen(
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

  final _i27.Key? key;

  final _i32.ExpressDataBloc bloc;

  final _i29.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'ExpressDataRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i8.GetAchBanckListScreen]
class GetAchBanckListRoute
    extends _i26.PageRouteInfo<GetAchBanckListRouteArgs> {
  GetAchBanckListRoute({
    _i27.Key? key,
    required _i33.GetAchBanckBloc bloc,
    required _i34.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
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

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GetAchBanckListRouteArgs>();
      return _i8.GetAchBanckListScreen(
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

  final _i27.Key? key;

  final _i33.GetAchBanckBloc bloc;

  final _i34.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'GetAchBanckListRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i9.GetAchDataScreen]
class GetAchDataRoute extends _i26.PageRouteInfo<GetAchDataRouteArgs> {
  GetAchDataRoute({
    _i27.Key? key,
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
    List<_i26.PageRouteInfo>? children,
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

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GetAchDataRouteArgs>();
      return _i9.GetAchDataScreen(
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

  final _i27.Key? key;

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
/// [_i10.GetEncriptedQrStringScreen]
class GetEncriptedQrStringRoute
    extends _i26.PageRouteInfo<GetEncriptedQrStringRouteArgs> {
  GetEncriptedQrStringRoute({
    _i27.Key? key,
    required _i29.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          GetEncriptedQrStringRoute.name,
          args: GetEncriptedQrStringRouteArgs(
            key: key,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'GetEncriptedQrStringRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GetEncriptedQrStringRouteArgs>();
      return _i10.GetEncriptedQrStringScreen(
        key: args.key,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class GetEncriptedQrStringRouteArgs {
  const GetEncriptedQrStringRouteArgs({
    this.key,
    required this.sessionBloc,
  });

  final _i27.Key? key;

  final _i29.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'GetEncriptedQrStringRouteArgs{key: $key, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i11.GetListDpfDigitalSolicitationScreen]
class GetListDpfDigitalSolicitationRoute extends _i26.PageRouteInfo<void> {
  const GetListDpfDigitalSolicitationRoute({List<_i26.PageRouteInfo>? children})
      : super(
          GetListDpfDigitalSolicitationRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetListDpfDigitalSolicitationRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i11.GetListDpfDigitalSolicitationScreen();
    },
  );
}

/// generated route for
/// [_i12.HomeScreen]
class HomeRoute extends _i26.PageRouteInfo<void> {
  const HomeRoute({List<_i26.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i12.HomeScreen();
    },
  );
}

/// generated route for
/// [_i13.InforAccionesScreen]
class InforAccionesRoute extends _i26.PageRouteInfo<void> {
  const InforAccionesRoute({List<_i26.PageRouteInfo>? children})
      : super(
          InforAccionesRoute.name,
          initialChildren: children,
        );

  static const String name = 'InforAccionesRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i13.InforAccionesScreen();
    },
  );
}

/// generated route for
/// [_i14.LoanFlowAnnuitiesDetailDataForCreditScreen]
class LoanFlowAnnuitiesDetailDataForCreditRoute
    extends _i26.PageRouteInfo<LoanFlowAnnuitiesDetailDataForCreditRouteArgs> {
  LoanFlowAnnuitiesDetailDataForCreditRoute({
    _i27.Key? key,
    required _i29.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          LoanFlowAnnuitiesDetailDataForCreditRoute.name,
          args: LoanFlowAnnuitiesDetailDataForCreditRouteArgs(
            key: key,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'LoanFlowAnnuitiesDetailDataForCreditRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoanFlowAnnuitiesDetailDataForCreditRouteArgs>();
      return _i14.LoanFlowAnnuitiesDetailDataForCreditScreen(
        key: args.key,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class LoanFlowAnnuitiesDetailDataForCreditRouteArgs {
  const LoanFlowAnnuitiesDetailDataForCreditRouteArgs({
    this.key,
    required this.sessionBloc,
  });

  final _i27.Key? key;

  final _i29.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'LoanFlowAnnuitiesDetailDataForCreditRouteArgs{key: $key, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i15.LoanFlowGetCreditDetailDataForRecoveryScreen]
class LoanFlowGetCreditDetailDataForRecoveryRoute extends _i26
    .PageRouteInfo<LoanFlowGetCreditDetailDataForRecoveryRouteArgs> {
  LoanFlowGetCreditDetailDataForRecoveryRoute({
    _i27.Key? key,
    required _i29.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          LoanFlowGetCreditDetailDataForRecoveryRoute.name,
          args: LoanFlowGetCreditDetailDataForRecoveryRouteArgs(
            key: key,
            sessionBloc: sessionBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'LoanFlowGetCreditDetailDataForRecoveryRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LoanFlowGetCreditDetailDataForRecoveryRouteArgs>();
      return _i15.LoanFlowGetCreditDetailDataForRecoveryScreen(
        key: args.key,
        sessionBloc: args.sessionBloc,
      );
    },
  );
}

class LoanFlowGetCreditDetailDataForRecoveryRouteArgs {
  const LoanFlowGetCreditDetailDataForRecoveryRouteArgs({
    this.key,
    required this.sessionBloc,
  });

  final _i27.Key? key;

  final _i29.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'LoanFlowGetCreditDetailDataForRecoveryRouteArgs{key: $key, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i16.LoginScreen1]
class LoginRoute1 extends _i26.PageRouteInfo<void> {
  const LoginRoute1({List<_i26.PageRouteInfo>? children})
      : super(
          LoginRoute1.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute1';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i16.LoginScreen1();
    },
  );
}

/// generated route for
/// [_i17.ParametersToDigitalDpfScreen]
class ParametersToDigitalDpfRoute
    extends _i26.PageRouteInfo<ParametersToDigitalDpfRouteArgs> {
  ParametersToDigitalDpfRoute({
    _i27.Key? key,
    required _i34.SessionInfoBloc sessioninfo,
    required _i35.GetParametersToDigitalDpfBloc bloc,
    List<_i26.PageRouteInfo>? children,
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

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ParametersToDigitalDpfRouteArgs>();
      return _i17.ParametersToDigitalDpfScreen(
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

  final _i27.Key? key;

  final _i34.SessionInfoBloc sessioninfo;

  final _i35.GetParametersToDigitalDpfBloc bloc;

  @override
  String toString() {
    return 'ParametersToDigitalDpfRouteArgs{key: $key, sessioninfo: $sessioninfo, bloc: $bloc}';
  }
}

/// generated route for
/// [_i18.PrExpressSolicitationWebScreen]
class PrExpressSolicitationWebRoute
    extends _i26.PageRouteInfo<PrExpressSolicitationWebRouteArgs> {
  PrExpressSolicitationWebRoute({
    _i27.Key? key,
    required List<String> listCodeSavingsAccount,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          PrExpressSolicitationWebRoute.name,
          args: PrExpressSolicitationWebRouteArgs(
            key: key,
            listCodeSavingsAccount: listCodeSavingsAccount,
          ),
          initialChildren: children,
        );

  static const String name = 'PrExpressSolicitationWebRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrExpressSolicitationWebRouteArgs>();
      return _i18.PrExpressSolicitationWebScreen(
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

  final _i27.Key? key;

  final List<String> listCodeSavingsAccount;

  @override
  String toString() {
    return 'PrExpressSolicitationWebRouteArgs{key: $key, listCodeSavingsAccount: $listCodeSavingsAccount}';
  }
}

/// generated route for
/// [_i19.ReceiveTransfersByCellPhoneNumberScreen]
class ReceiveTransfersByCellPhoneNumberRoute extends _i26.PageRouteInfo<void> {
  const ReceiveTransfersByCellPhoneNumberRoute(
      {List<_i26.PageRouteInfo>? children})
      : super(
          ReceiveTransfersByCellPhoneNumberRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReceiveTransfersByCellPhoneNumberRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i19.ReceiveTransfersByCellPhoneNumberScreen();
    },
  );
}

/// generated route for
/// [_i20.ReportMovementByPErsonAndDateScreen]
class ReportMovementByPErsonAndDateRoute extends _i26.PageRouteInfo<void> {
  const ReportMovementByPErsonAndDateRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ReportMovementByPErsonAndDateRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportMovementByPErsonAndDateRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i20.ReportMovementByPErsonAndDateScreen();
    },
  );
}

/// generated route for
/// [_i21.SavingAccountExtractDataTranSacreen]
class SavingAccountExtractDataTranSacreen
    extends _i26.PageRouteInfo<SavingAccountExtractDataTranSacreenArgs> {
  SavingAccountExtractDataTranSacreen({
    _i27.Key? key,
    required _i36.SavingAccountExtracBloc bloc,
    required _i34.SessionInfoBloc sessionBloc,
    List<_i26.PageRouteInfo>? children,
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

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingAccountExtractDataTranSacreenArgs>();
      return _i21.SavingAccountExtractDataTranSacreen(
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

  final _i27.Key? key;

  final _i36.SavingAccountExtracBloc bloc;

  final _i34.SessionInfoBloc sessionBloc;

  @override
  String toString() {
    return 'SavingAccountExtractDataTranSacreenArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc}';
  }
}

/// generated route for
/// [_i22.SavingAccountTransMobileEndScreen]
class SavingAccountTransMobileEndRoute
    extends _i26.PageRouteInfo<SavingAccountTransMobileEndRouteArgs> {
  SavingAccountTransMobileEndRoute({
    _i27.Key? key,
    required _i37.SavingsAccountTransferMobileResponseEntity response,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          SavingAccountTransMobileEndRoute.name,
          args: SavingAccountTransMobileEndRouteArgs(
            key: key,
            response: response,
          ),
          initialChildren: children,
        );

  static const String name = 'SavingAccountTransMobileEndRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SavingAccountTransMobileEndRouteArgs>();
      return _i22.SavingAccountTransMobileEndScreen(
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

  final _i27.Key? key;

  final _i37.SavingsAccountTransferMobileResponseEntity response;

  @override
  String toString() {
    return 'SavingAccountTransMobileEndRouteArgs{key: $key, response: $response}';
  }
}

/// generated route for
/// [_i23.SettingsScreen]
class SettingsRoute extends _i26.PageRouteInfo<void> {
  const SettingsRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i23.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i24.TransferFeesTwoScreen]
class TransferFeesTwoRoute
    extends _i26.PageRouteInfo<TransferFeesTwoRouteArgs> {
  TransferFeesTwoRoute({
    _i27.Key? key,
    required String? cuentaO,
    required String? cuentaD,
    required String? monto,
    required String? saldo,
    required List<String>? titulares,
    List<_i26.PageRouteInfo>? children,
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

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransferFeesTwoRouteArgs>();
      return _i24.TransferFeesTwoScreen(
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

  final _i27.Key? key;

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
/// [_i25.TransferScreen]
class TransferRoute extends _i26.PageRouteInfo<TransferRouteArgs> {
  TransferRoute({
    _i27.Key? key,
    required _i38.SavingAccountDataBloc bloc,
    required _i34.SessionInfoBloc sessionBloc,
    required _i25.TransferType transferType,
    List<_i26.PageRouteInfo>? children,
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

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TransferRouteArgs>();
      return _i25.TransferScreen(
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

  final _i27.Key? key;

  final _i38.SavingAccountDataBloc bloc;

  final _i34.SessionInfoBloc sessionBloc;

  final _i25.TransferType transferType;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key, bloc: $bloc, sessionBloc: $sessionBloc, transferType: $transferType}';
  }
}
