import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/data/datasource/get_current_qr_by_type_datasource.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/data/repositories/get_current_qr_by_type_repository_impl.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/domain/repositories/get_current_qr_by_type_repository.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/presentation/bloc/get_current_qr_by_type_bloc.dart';
import 'package:get_it/get_it.dart';

void initCurrentQrByType(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => GetCurrentQrByTypeDatasource(apiClient));
  getIt.registerFactory<GetCurrentQrByTypeRepository>(
    () => GetCurrentQrByTypeRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<GetCurrentQrByTypeBloc>(
    () => GetCurrentQrByTypeBloc(getIt()),
  );
}
