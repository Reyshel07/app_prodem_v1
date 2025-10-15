import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_external_payment_generate_file_by_web_client/data/datasource/get_external_payment_generate_file_web_client_datasource.dart';
import 'package:app_prodem_v1/modules/get_external_payment_generate_file_by_web_client/data/repositories/get_external_payment_generate_file_web_client_repository_impl.dart';
import 'package:app_prodem_v1/modules/get_external_payment_generate_file_by_web_client/domain/repositories/get_external_payment_generate_file_web_client_repository.dart';
import 'package:app_prodem_v1/modules/get_external_payment_generate_file_by_web_client/presentation/bloc/get_external_payment_generate_file_web_client_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetExternalPaymentGenerateFileWebClient(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetExternalPaymentGenerateFileWebClientDatasource(apiClient),
  );
  getIt.registerFactory<GetExternalPaymentGenerateFileWebClientRepository>(
    () => GetExternalPaymentGenerateFileWebClientRepositoryImpl(
      datasource: getIt(),
    ),
  );
  getIt.registerFactory(
    () => GetExternalPaymentGenerateFileWebClientBloc(getIt()),
  );
}
