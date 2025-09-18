import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/repositori_impl.dart';
import 'domain/repositories/user_session_info_repository.dart';
import 'presentation/bloc/bloc.dart';

void initUserSessionInfo(GetIt getIt) {
  getIt.registerLazySingleton(() => UserSessionInfoDataSouce());
  getIt.registerFactory<UserSessionInfoRepository>(
    () => UserSessionInfoRepositoryImpl(dataSouce: getIt()),
  );
  getIt.registerFactory<SessionInfoBloc>(() => SessionInfoBloc(getIt()));
}
