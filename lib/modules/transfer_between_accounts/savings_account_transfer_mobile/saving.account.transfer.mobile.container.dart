import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/data/datasource/saving_account_transfer_mobile_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/data/repositories/saving_account_transfer_mobile_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/repository.dart';
import 'presentation/bloc/bloc.dart';

void initSavingAccountTransMobile(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => SavingAccountTransferMobileDatasource(apiClient),
  );
  getIt.registerFactory<SavingAccountTransferMobileRepository>(
    () => SavingAccountTransferMobileRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<SavingAccountTransferMobileBloc>(
    () => SavingAccountTransferMobileBloc(getIt()),
  );
}
