import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/web_person_device_authenticate_pr_key/data/datasource/web_person_device_authenticate_pr_ky_datasource.dart';
import 'package:app_prodem_v1/modules/web_person_device_authenticate_pr_key/data/repositories/web_person_device_authenticate_pr_repository_impl.dart';
import 'package:app_prodem_v1/modules/web_person_device_authenticate_pr_key/domain/repositories/web_person_device_authenticate_pr_key_repository.dart';
import 'package:app_prodem_v1/modules/web_person_device_authenticate_pr_key/presentation/bloc/web_person_device_authenticate_pr_key_bloc.dart';
import 'package:get_it/get_it.dart';

void initWebPersonDeviceAuthenticatePrKey(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => WebPersonDeviceAuthenticatePrKyDatasource(apiClient),
  );
  getIt.registerFactory<WebPersonDeviceAuthenticatePrKeyRepository>(
    () => WebPersonDeviceAuthenticatePrRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<WebPersonDeviceAuthenticatePrKeyBloc>(
    () => WebPersonDeviceAuthenticatePrKeyBloc(getIt()),
  );
}
