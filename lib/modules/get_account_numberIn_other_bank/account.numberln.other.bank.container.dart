import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/data/datasource/get_account_numberln_other_bank_datasource.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/data/repositories/get_account_numberin_other_bank_repository_impl.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/domain/repositories/get_account_numberln_other_bank_repository.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/presentation/bloc/get_account_numberln_other_bank_bloc.dart';
import 'package:get_it/get_it.dart';

void initAccountNumberlnOtherBank(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetAccountNumberlnOtherBankDatasource(apiClient),
  );
  getIt.registerFactory<GetAccountNumberlnOtherBankRepository>(
    () => GetAccountNumberinOtherBankRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<GetAccountNumberlnOtherBankBloc>(
    () => GetAccountNumberlnOtherBankBloc(getIt()),
  );
}
