import 'package:app_prodem_v1/config/router/app_router.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/data/datasource/sign_in_datasource.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/data/repositories/sign_in_response_repository_impl.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/domain/repositories/sign_in_response_repository.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/presentation/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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
  }

  //getIt.registerSingleton
}
