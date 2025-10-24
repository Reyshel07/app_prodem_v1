import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/get_web_bank_guarantee_solicitation_data/data/datasource/get_web_bank_guarantee_solicitation_data_datasource.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/get_web_bank_guarantee_solicitation_data/data/repositories/get_web_bank_guarantee_solicitation_data_repository_impl.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/get_web_bank_guarantee_solicitation_data/domain/repositories/get_web_bank_guarantee_solicitation_data_repository.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/get_web_bank_guarantee_solicitation_data/presentation/bloc/get_web_bank_guarantee_solicitation_data_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetWebBankGuaranteeSolicitationData(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetWebBankGuaranteeSolicitationDataDatasource(apiClient),
  );
  getIt.registerFactory<GetWebBankGuaranteeSolicitationDataRepository>(
    () => GetWebBankGuaranteeSolicitationDataRepositoryImpl(
      dataDatasource: getIt(),
    ),
  );
  getIt.registerFactory<GetWebBankGuaranteeSolicitationDataBloc>(
    () => GetWebBankGuaranteeSolicitationDataBloc(getIt()),
  );
}
