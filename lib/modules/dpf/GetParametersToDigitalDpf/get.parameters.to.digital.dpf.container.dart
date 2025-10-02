import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/data/datasource/get_parameters_to_digital_dpf_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/data/repositories/get_parameters_to_digital_dpf_repository_impl.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/domain/repositories/repository.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/bloc/get_office_list_by_id_geo_bloc.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/presentation/bloc/get_parameters_to_digital_dpf_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetParametersToDigitalDpf(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetParametersToDigitalDpfDatasource(apiClient),
  );
  getIt.registerFactory<GetParametersToDigitalDpfRepository>(
    () => GetParametersToDigitalDpfRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => GetParametersToDigitalDpfBloc(getIt()));
  getIt.registerFactory(() => GetOfficeListByIdGeoBloc(getIt()));
}
