import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/data/datasource/pr_express_solicitation_web_datasource.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/data/repositories/pr_express_solicitation_web_repository_impl.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/domain/repositories/pr_express_solicitation_web_repository.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/presentation/bloc/pr_express_solicitation_web_bloc.dart';
import 'package:get_it/get_it.dart';

void initPrExpressSoliWeb(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => PrExpressSolicitationWebDatasource(apiClient),
  );
  getIt.registerFactory<PrExpressSolicitationWebRepository>(
    () => PrExpressSolicitationWebRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<PrExpressSolicitationWebBloc>(
    () => PrExpressSolicitationWebBloc(getIt()),
  );
}
