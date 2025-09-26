import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/data/datasource/transfer_ach_from_mobile_banking_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/data/repositories/transfer_ach_from_mobile_banking_repository_impl.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/domain/repositories/transfer_ach_from_mobile_banking_repository.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/presentation/bloc/transfer_ach_from_mobile_banking_bloc.dart';
import 'package:get_it/get_it.dart';

void inittransferAchFromMobileBanking(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => TransferAchFromMobileBankingDatasource(apiClient),
  );
  getIt.registerFactory<TransferAchFromMobileBankingRepository>(
    () => TransferAchFromMobileBankingRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<TransferAchFromMobileBankingBloc>(
    () => TransferAchFromMobileBankingBloc(getIt()),
  );
}
