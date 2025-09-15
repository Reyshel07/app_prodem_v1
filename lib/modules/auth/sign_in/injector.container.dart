import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../config/router/router.dart';
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
    getIt.registerLazySingleton(() => SignInDatasource());
    getIt.registerFactory<SignInResponseRepository>(
      () => SignInResponseRepositoryImpl(datasource: getIt()),
    );
    getIt.registerFactory(() => AuthBloc(getIt()));

    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerLazySingleton(() => UserSessionInfoDataSouce());
    getIt.registerFactory(
      <UserSessionInfoRepository>() =>
          UserSessionInfoRepositoryImpl(dataSouce: getIt()),
    );
    getIt.registerFactory(() => SessionInfoBloc(getIt()));
    //getIt.registerSingleton<AppRouter>(AppRouter());
  }

  //getIt.registerSingleton
}
