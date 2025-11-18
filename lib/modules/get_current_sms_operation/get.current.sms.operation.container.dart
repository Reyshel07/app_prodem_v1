import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_current_sms_operation/data/repositories/get_current_sms_operation_repository_impl.dart';
import 'package:app_prodem_v1/modules/get_current_sms_operation/presentation/bloc/get_current_sms_operation_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';
import 'domain/repositories/repository.dart';

void initGetCurrentSmsOperation(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetCurrentSmsOperationDatasource(apiClient),
  );
  getIt.registerFactory<GetCurrentSmsOperationRepository>(
    () => GetCurrentSmsOperationRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => GetCurrentSmsOperationBloc(getIt()));
}
