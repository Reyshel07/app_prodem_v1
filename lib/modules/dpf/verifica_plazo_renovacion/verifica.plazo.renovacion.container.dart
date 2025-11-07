import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/verifica_plazo_renovacion/data/repositories/verifica_plazo_renovacion_repository_impl.dart';
import 'package:app_prodem_v1/modules/dpf/verifica_plazo_renovacion/presentation/bloc/verifica_plazo_renovacion_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';
import 'domain/repositories/repository.dart';

void initVerificaPlazoRenovacion(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => VerificaPlazoRenovacionDatasource(apiClient),
  );
  getIt.registerFactory<VerificaPlazoRenovacionRepository>(
    () => VerificaPlazoRenovacionRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<VerificaPlazoRenovacionBloc>(
    () => VerificaPlazoRenovacionBloc(getIt()),
  );
}
