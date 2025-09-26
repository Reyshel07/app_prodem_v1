import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/data/datasource/get_ach_data_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/data/repositories/get_ach_data_repository_impl.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/domain/repositories/get_ach_data_repository.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/presentation/bloc/get_ach_data_bloc.dart';
import 'package:get_it/get_it.dart';

void initGEtAchData(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => GetAchDataDatasource(apiClient));
  getIt.registerFactory<GetAchDataRepository>(
    () => GetAchDataRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<GetAchDataBloc>(() => GetAchDataBloc(getIt()));
}
