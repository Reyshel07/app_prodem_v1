import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/bloc/get_desmaterialization_rerport_to_web_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/repositori_impl.dart';
import 'domain/repositories/user_session_info_repository.dart';
import 'presentation/bloc/bloc.dart';

void initUserSessionInfo(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => UserSessionInfoDataSouce(apiClient));
  getIt.registerFactory<UserSessionInfoRepository>(
    () => UserSessionInfoRepositoryImpl(dataSouce: getIt()),
  );
  getIt.registerFactory<SessionInfoBloc>(() => SessionInfoBloc(getIt()));
  getIt.registerFactory<GetDesmaterializationRerportToWebBloc>(
    () => GetDesmaterializationRerportToWebBloc(getIt()),
  );
}
