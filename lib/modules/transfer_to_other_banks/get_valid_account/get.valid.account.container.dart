import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/data/datasource/get_valid_account_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/data/repositories/get_valid_account_repository_impl.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/domain/repositories/get_valid_account_repository.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/presentation/bloc/get_valid_account_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetValidAccount(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => GetValidAccountDatasource(apiClient));
  getIt.registerFactory<GetValidAccountRepository>(
    () => GetValidAccountRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<GetValidAccountBloc>(
    () => GetValidAccountBloc(getIt()),
  );
}
