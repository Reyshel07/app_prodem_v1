import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/home/settings_screen/get_account_enabled_to_transfer/data/datasource/get_account_enabled_to_transfer_datsource.dart';
import 'package:app_prodem_v1/modules/home/settings_screen/get_account_enabled_to_transfer/data/repositories/get_account_enabled_to_transfer_repository_impl.dart';
import 'package:app_prodem_v1/modules/home/settings_screen/get_account_enabled_to_transfer/domain/repositories/get_account_enabled_to_transfer_repository.dart';
import 'package:app_prodem_v1/modules/home/settings_screen/get_account_enabled_to_transfer/presentation/bloc/get_account_enable_to_transfer_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetAccountEnableToTransfer(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => GetAccountEnabledToTransferDatsource(apiClient),
  );
  getIt.registerFactory<GetAccountEnabledToTransferRepository>(
    () => GetAccountEnabledToTransferRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<GetAccountEnableToTransferBloc>(
    () => GetAccountEnableToTransferBloc(getIt()),
  );
}
