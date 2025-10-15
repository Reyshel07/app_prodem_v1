import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/list_get_other_account_deposit/data/datasource/list_get_other_account_deposit_datasource.dart';
import 'package:app_prodem_v1/modules/list_get_other_account_deposit/data/repositories/list_get_other_account_deposit_repository_impl.dart';
import 'package:app_prodem_v1/modules/list_get_other_account_deposit/domain/repositories/list_get_other_account_deposit_repository.dart';
import 'package:app_prodem_v1/modules/list_get_other_account_deposit/presentation/bloc/list_get_other_account_deposit_bloc.dart';
import 'package:get_it/get_it.dart';

void initListGetOtherAccountDeposit(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => ListGetOtherAccountDepositDatasource(apiClient),
  );
  getIt.registerFactory<ListGetOtherAccountDepositRepository>(
    () => ListGetOtherAccountDepositRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => ListGetOtherAccountDepositBloc(getIt()));
}
