import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credit_card/credit_card_data_for_recovery/data/datasource/credit_car_data_for_recovery_datasource.dart';
import 'package:app_prodem_v1/modules/credit_card/credit_card_data_for_recovery/data/repositories/credit_car_data_for_recovery_repository_impl.dart';
import 'package:app_prodem_v1/modules/credit_card/credit_card_data_for_recovery/domain/repositories/credit_car_data_for_recovery_repository.dart';
import 'package:app_prodem_v1/modules/credit_card/credit_card_data_for_recovery/presentation/bloc/credit_car_data_for_recovery_bloc.dart';
import 'package:get_it/get_it.dart';

void initCreditCardDataForRecovery(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => CreditCarDataForRecoveryDatasource(apiClient),
  );
  getIt.registerFactory<CreditCarDataForRecoveryRepository>(
    () => CreditCarDataForRecoveryRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => CreditCarDataForRecoveryBloc(getIt()));
}
