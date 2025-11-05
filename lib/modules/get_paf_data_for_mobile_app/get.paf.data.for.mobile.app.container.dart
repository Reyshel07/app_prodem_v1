import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_paf_data_for_mobile_app/data/repositories/get_paf_data_for_mobile_app_repository_impl.dart';
import 'package:app_prodem_v1/modules/get_paf_data_for_mobile_app/presentation/bloc/get_paf_data_for_mobile_app_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';
import 'domain/repositories/repository.dart';

void initGetPafDataForMobileApp(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetPafDataForMobileAppDatasource(apiClient),
  );
  getIt.registerFactory<GetPafDataForMobileAppRepository>(
    () => GetPafDataForMobileAppRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => GetPafDataForMobileAppBloc(getIt()));
}
