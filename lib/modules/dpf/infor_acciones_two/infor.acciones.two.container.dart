import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/data/datasource/inf_acciones_two_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/data/repositories/inf_acciones_two_repository_impl.dart';
import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/domain/repositories/inf_acciones_two_repository.dart';
import 'package:app_prodem_v1/modules/dpf/infor_acciones_two/presentation/bloc/infor_acciones_two_bloc.dart';
import 'package:get_it/get_it.dart';

void initInfAccionesTwo(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => InfAccionesTwoDatasource(apiClient));
  getIt.registerFactory<InfAccionesTwoRepository>(
    () => InfAccionesTwoRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<InforAccionesTwoBloc>(
    () => InforAccionesTwoBloc(getIt()),
  );
}
