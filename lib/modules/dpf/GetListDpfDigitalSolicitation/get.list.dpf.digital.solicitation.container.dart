import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/data/datasource/get_list_dpf_digital_solicitation_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/data/repositories/get_list_dpf_digital_solicitation_repository_impl.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/domain/repositories/get_list_dpf_digital_solicitation_repository.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/presentation/bloc/get_list_dpf_digital_solicitation_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetListDigitalSolicitation(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetListDpfDigitalSolicitationDatasource(apiClient),
  );
  getIt.registerFactory<GetListDpfDigitalSolicitationRepository>(
    () => GetListDpfDigitalSolicitationRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => GetListDpfDigitalSolicitationBloc(getIt()));
}
