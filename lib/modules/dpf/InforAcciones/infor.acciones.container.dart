import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/data/datasource/infor_acciones_datasource.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/data/repositories/infor_acciones_repository_impl.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/domain/repositories/infor_acciones_repository.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/presentation/bloc/infor_acciones_bloc.dart';
import 'package:get_it/get_it.dart';

void initInforAcciones(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => InforAccionesDatasource(apiClient));
  getIt.registerFactory<InforAccionesRepository>(
    () => InforAccionesRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<InforAccionesBloc>(() => InforAccionesBloc(getIt()));
}
