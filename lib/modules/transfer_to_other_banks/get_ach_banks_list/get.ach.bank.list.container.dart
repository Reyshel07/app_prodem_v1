import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/data/datasource/get_ach_banck_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/data/repositories/get_ach_banck_repository_impl.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/domain/repositories/get_ach_banck_repository.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/presentation/bloc/get_ach_banck_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetAchBankList(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => GetAchBanckDatasource(apiClient));
  getIt.registerFactory<GetAchBanckRepository>(
    () => GetAchBanckRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<GetAchBanckBloc>(() => GetAchBanckBloc(getIt()));
}
