import 'package:app_prodem_v1/modules/auth/auth.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/injector.container.dart';
import 'package:app_prodem_v1/modules/home/GetAccountBalances/account.balances.container.dart';
import 'package:app_prodem_v1/modules/home/SavingsAccountExtractDataTransactionable/savings.account.container.dart';
import 'package:app_prodem_v1/modules/transfer%20between%20accounts/GetSavingAccountData/saving_account_data_container.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'config/router/router.dart';

class InjectorContainer {
  InjectorContainer();

  static final getIt = GetIt.instance;

  static setupGetIt() {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerSingleton<AppRouter>(AppRouter());
    //
    initAuthContainer(getIt);
    initUserSessionInfo(getIt);
    initAccountsBalances(getIt);
    initSavingsAccountExtrcContainer(getIt);
    initSavingAccountData(getIt);
  }
}
