import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/data/datasource/create_dpf_solicitation_internal_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/data/repositories/create_dpf_solicitation_internal_repository_impl.dart';
import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/domain/repositories/create_dpf_solicitation_internal_repository.dart';
import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/presentation/bloc/create_dpf_solicitation_internal_bloc.dart';
import 'package:get_it/get_it.dart';

void initCreateDpfSolicitationInternal(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => CreateDpfSolicitationInternalDatasource
  (apiClient));
  getIt.registerFactory<CreateDpfSolicitationInternalRepository>(
    () => CreateDpfSolicitationInternalRepositoryImpl(datasource:  getIt()),
  );
  getIt.registerFactory<CreateDpfSolicitationInternalBloc>(() => CreateDpfSolicitationInternalBloc(getIt()));
}