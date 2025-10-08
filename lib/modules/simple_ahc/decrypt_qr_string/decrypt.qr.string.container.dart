import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/data/datasource/decrypt_qr_string_datasource.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/data/repositories/decrypt_qr_string_repository_impl.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/domain/repositories/decrypt_qr_string_repository.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/presentation/bloc/decrypt_qr_string_bloc.dart';
import 'package:get_it/get_it.dart';

void initDecryptQrString(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => DecryptQrStringDatasource(apiClient));
  getIt.registerFactory<DecryptQrStringRepository>(
    () => DecryptQrStringRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<DecryptQrStringBloc>(
    () => DecryptQrStringBloc(getIt()),
  );
}
