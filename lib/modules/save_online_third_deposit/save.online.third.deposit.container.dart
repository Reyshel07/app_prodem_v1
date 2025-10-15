import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/data/datasource/save_online_third_deposit_datasource.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/data/repositories/save_online_third_deposit_repository_impl.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/domain/repositories/save_online_third_deposit_repository.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/presentation/bloc/save_online_third_deposit_bloc.dart';
import 'package:get_it/get_it.dart';

void initSaveOnlineThirdDeposit(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => SaveOnlineThirdDepositDatasource(apiClient),
  );
  getIt.registerFactory<SaveOnlineThirdDepositRepository>(
    () => SaveOnlineThirdDepositRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => SaveOnlineThirdDepositBloc(getIt()));
}
