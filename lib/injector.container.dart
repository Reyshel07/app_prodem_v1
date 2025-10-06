import 'package:app_prodem_v1/modules/auth/auth.container.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/get.list.dpf.digital.solicitation.container.dart';
import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/create.dpf.solicitation.intenal.container.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/get.parameters.to.digital.dpf.container.dart';
import 'package:app_prodem_v1/modules/lightning%20turn/GetProdemExpressData/express.data.container.dart';
import 'package:app_prodem_v1/modules/lightning%20turn/GetProdemExpressSolicitationWeb/pr.express.soli.web.container.dart';
import 'package:app_prodem_v1/modules/home/settings_screen/get_account_enabled_to_transfer/receive.transfer.by.to.transfer.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/get.ach.bank.list.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/injector.container.dart';
import 'package:app_prodem_v1/modules/home/GetAccountBalances/account.balances.container.dart';
import 'package:app_prodem_v1/modules/home/savingsAccountExtractDataTransactionable/savings.account.container.dart';
import 'package:app_prodem_v1/modules/key_pr/pr.key.container.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/GetSavingAccountData/saving_account_data_container.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/saving.account.transfer.mobile.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/get.ach.data.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/get.valid.account.container.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/transfer.ach.from.mobile.container.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'config/router/router.dart';

///central container
class InjectorContainer {
  InjectorContainer();

  static final getIt = GetIt.instance;

  static setupGetIt() {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerSingleton<AppRouter>(AppRouter());
    initAuthContainer(getIt);
    initUserSessionInfo(getIt);
    initAccountsBalances(getIt);
    initSavingsAccountExtrcContainer(getIt);
    initSavingAccountData(getIt);
    initKeyPr(getIt);
    initSavingAccountTransMobile(getIt);
    initGetAchBankList(getIt);
    initGetValidAccount(getIt);
    initGEtAchData(getIt);
    inittransferAchFromMobileBanking(getIt);
    initExpressData(getIt);
    initPrExpressSoliWeb(getIt);
    initGetAccountEnableToTransfer(getIt);
    initGetParametersToDigitalDpf(getIt);
    initGetListDigitalSolicitation(getIt);
    initCreateDpfSolicitationInternal(getIt);
  }
}
