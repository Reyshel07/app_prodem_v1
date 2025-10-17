import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/ATM/validate_qr_from_prodem_movil/presentation/bloc/validate_qr_from_prodem_movil_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';
import 'data/repositories/validate_qr_from_prodem_movil_repository_impl.dart';
import 'domain/repositories/repository.dart';

void initVAlidateQrFromPRodemMovil(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => ValidateQrFromProdemMovilDatasource(apiClient),
  );
  getIt.registerFactory<ValidateQrFromProdemMovilRepository>(
    () => ValidateQrFromProdemMovilRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<ValidateQrFromProdemMovilBloc>(
    () => ValidateQrFromProdemMovilBloc(getIt()),
  );
}
