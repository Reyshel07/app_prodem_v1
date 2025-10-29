import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_obtain_operating_debt_balance/data/repositories/sintesis_obtain_operating_debt_balance_repository_impl.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_obtain_operating_debt_balance/presentation/bloc/sintesis_obtain_operating_debt_balance_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasource/datasource.dart';
import 'domain/repositories/repository.dart';

void initSintesisObtainOperatingDebtBalance(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => SintesisObtainOperatingDebtBalanceDatasource(apiClient),
  );
  getIt.registerFactory<SintesisObtainOperatingDebtBalanceRepository>(
    () => SintesisObtainOperatingDebtBalanceRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<SintesisObtainOperatingDebtBalanceBloc>(
    () => SintesisObtainOperatingDebtBalanceBloc(getIt()),
  );
}
