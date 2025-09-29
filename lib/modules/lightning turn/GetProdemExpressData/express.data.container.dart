import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/lightning%20turn/GetProdemExpressData/data/datasource/datasource.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/express_data_repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'presentation/bloc/express_data_bloc.dart';

void initExpressData(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => ExpressDataDatasource(apiClient));
  getIt.registerFactory<ProdemExpressDataRepository>(
    () => ProdemExpressDataRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => ExpressDataBloc(getIt()));
}
