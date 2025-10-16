import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/lightning_turn/prodem_express_save_solicitation/presentation/bloc/prodem_express_save_solicitation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'data/repositories/prodem_express_save_solicitation_repository_impl.dart';
import 'domain/repositories/repository.dart';

void initPrExpressSaveSolicitation(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => ProdemExpressSaveSolicitationDatasource(apiClient),
  );
  getIt.registerFactory<ProdemExpressSaveSolicitationRepository>(
    () => ProdemExpressSaveSolicitationRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => ProdemExpressSaveSolicitationBloc(getIt()));
}
