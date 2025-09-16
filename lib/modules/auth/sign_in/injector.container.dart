import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../config/router/router.dart';
import '../../savings accounts/consultations with CA/GetAccountBalances/data/datasource/datasource.dart';
import '../../savings accounts/consultations with CA/GetAccountBalances/data/repositories/respository_impl.dart';
import '../../savings accounts/consultations with CA/GetAccountBalances/domain/repositories/repository.dart';
import '../../savings accounts/consultations with CA/GetAccountBalances/presentation/bloc/bloc.dart';
import '../../savings accounts/consultations with CA/SavingsAccountExtractDataTransactionable/data/datasource/datasource.dart';
import '../../savings accounts/consultations with CA/SavingsAccountExtractDataTransactionable/data/repositories/repository_impl.dart';
import '../../savings accounts/consultations with CA/SavingsAccountExtractDataTransactionable/domain/repositories/repository.dart';
import '../../savings accounts/consultations with CA/SavingsAccountExtractDataTransactionable/presentation/bloc/bloc.dart';
import '../../home/UserSessionInfo/data/datasource/datasource.dart';
import '../../home/UserSessionInfo/data/repositories/repositori_impl.dart';
import '../../home/UserSessionInfo/presentation/bloc/bloc.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/repositories_impl.dart';
import 'domain/repositories/repositories.dart';
import 'presentation/bloc/bloc.dart';

class InjectorContainer {
  InjectorContainer();

  static final getIt = GetIt.instance;

  static setupGetIt() {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerSingleton<AppRouter>(AppRouter());

    getIt.registerLazySingleton(() => SignInDatasource());
    getIt.registerFactory<SignInResponseRepository>(
      () => SignInResponseRepositoryImpl(datasource: getIt()),
    );
    getIt.registerFactory(() => AuthBloc(getIt()));

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
