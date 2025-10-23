import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/presentation/bloc/initial_charge_bank_guarantee_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/initial_charge_bank_guarante_datasource.dart';
import 'data/repositories/initial_charge_bank_guarante_repository_impl.dart';
import 'domain/repositories/initial_charge_bank_guarante_repository.dart';

void initInitialChargeBankGuarante(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => InitialChargeBankGuaranteDatasource(apiClient),
  );
  getIt.registerFactory<InitialChargeBankGuaranteRepository>(
    () => InitialChargeBankGuaranteRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => InitialChargeBankGuaranteeBloc(getIt()));
}
