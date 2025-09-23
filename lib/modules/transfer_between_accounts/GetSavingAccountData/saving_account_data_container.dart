import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/datasource.dart';
import 'data/repositories/saving_account_data_repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'presentation/bloc/bloc.dart';

void initSavingAccountData(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => SavingAccountDatasource(apiClient));
  getIt.registerFactory<SavingAccountDataRepository>(
    () => SavingAccountDataRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<SavingAccountDataBloc>(
    () => SavingAccountDataBloc(getIt()),
  );
}
