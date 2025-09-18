import 'package:app_prodem_v1/modules/auth/auth.container.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'config/router/router.dart';
import 'modules/savings accounts/consultations with CA/GetAccountBalances/data/datasource/datasource.dart';
import 'modules/savings accounts/consultations with CA/GetAccountBalances/data/repositories/respository_impl.dart';
import 'modules/savings accounts/consultations with CA/GetAccountBalances/domain/repositories/repository.dart';
import 'modules/savings accounts/consultations with CA/GetAccountBalances/presentation/bloc/bloc.dart';
import 'modules/savings accounts/consultations with CA/SavingsAccountExtractDataTransactionable/data/datasource/datasource.dart';
import 'modules/savings accounts/consultations with CA/SavingsAccountExtractDataTransactionable/data/repositories/repository_impl.dart';
import 'modules/savings accounts/consultations with CA/SavingsAccountExtractDataTransactionable/domain/repositories/repository.dart';
import 'modules/savings accounts/consultations with CA/SavingsAccountExtractDataTransactionable/presentation/bloc/bloc.dart';
import 'modules/home/UserSessionInfo/data/datasource/datasource.dart';
import 'modules/home/UserSessionInfo/data/repositories/repositori_impl.dart';
import 'modules/home/UserSessionInfo/presentation/bloc/bloc.dart';

class InjectorContainer {
  InjectorContainer();

  static final getIt = GetIt.instance;

  static setupGetIt() {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerSingleton<AppRouter>(AppRouter());
    //
    initAuthContainer(getIt);

    getIt.registerLazySingleton(() => UserSessionInfoDataSouce());
    getIt.registerFactory(
      <UserSessionInfoRepository>() =>
          UserSessionInfoRepositoryImpl(dataSouce: getIt()),
    );
    getIt.registerFactory(() => SessionInfoBloc(getIt()));

    getIt.registerLazySingleton(() => AccountBalancesDatasource());
    getIt.registerFactory<AccountBalancesRespositoriy>(
      () => AccountBalancesRespositoryImpl(accountBalancesDatasource: getIt()),
    );
    getIt.registerFactory(() => AccountBalanceBloc(getIt()));

    getIt.registerLazySingleton(() => SavingAccountExtracDatasource());
    getIt.registerFactory<SavingAccountExtracRespository>(
      () => SavingAccountExtracImpl(savingAccountExtracDatasource: getIt()),
    );
    getIt.registerFactory(() => SavingAccountExtracBloc(getIt()));

    //getIt.registerSingleton<AppRouter>(AppRouter());
  }
}
