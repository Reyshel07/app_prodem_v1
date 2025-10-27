import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/data/datasource/sintesis_get_search_parameters_by_module_datasource.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/data/repositories/sintesis_get_search_parameters_by_module_repository_impl.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/domain/repositories/sintesis_get_search_parameters_by_module_repository.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/presentation/bloc/sintesis_get_search_parameters_by_module_bloc.dart';
import 'package:get_it/get_it.dart';

void initSintesisGetSechrParametersByModule(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => SintesisGetSearchParametersByModuleDatasource(apiClient),
  );
  getIt.registerFactory<SintesisGetSearchParametersByModuleRepository>(
    () =>
        SintesisGetSearchParametersByModuleRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<SintesisGetSearchParametersByModuleBloc>(
    () => SintesisGetSearchParametersByModuleBloc(getIt()),
  );
}
