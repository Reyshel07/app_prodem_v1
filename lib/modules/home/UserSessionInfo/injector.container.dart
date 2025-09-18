/*import 'package:get_it/get_it.dart';
import '../../../config/router/router.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/repositori_impl.dart';
import 'presentation/bloc/bloc.dart';

class InjertoContainerSession {
  InjertoContainerSession();
  static final getIt = GetIt.instance;
  static setupGetIt() {
    //getIt.registerLazySingleton(() => Dio());
    getIt.registerLazySingleton(() => UserSessionInfoDataSouce());
    getIt.registerFactory(
      <UserSessionInfoRepository>() =>
          UserSessionInfoRepositoryImpl(dataSouce: getIt()),
    );
    getIt.registerFactory(() => SessionInfoBloc(getIt()));
    getIt.registerSingleton<AppRouter>(AppRouter());
  }
}*/
