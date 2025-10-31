import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_payment_process/presentation/bloc/sintesis_payment_process_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/sintesis_payment_process_repository_impl.dart';
import 'domain/repositories/repository.dart';

void initSintesisPaymentProcess(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => SintesisPaymentProcessDatasource(apiClient),
  );
  getIt.registerFactory<SintesisPaymentProcessRepository>(
    () => SintesisPaymentProcessRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<SintesisPaymentProcessBloc>(
    () => SintesisPaymentProcessBloc(getIt()),
  );
}
