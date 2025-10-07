import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/data/datasource/get_encrypted_qr_string_datasource.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/data/repositories/get_encrypted_qr_string_repostory_impl.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/domain/repositories/get_encrypted_qr_string_repository.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/presentation/bloc/get_encripted_qr_string_bloc.dart';
import 'package:get_it/get_it.dart';

void initGEtEncriptedQrString(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => GetEncryptedQrStringDatasource(apiClient));
  getIt.registerFactory<GetEncryptedQrStringRepository>(
    () => GetEncryptedQrStringRepostoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<GetEncriptedQrStringBloc>(
    () => GetEncriptedQrStringBloc(getIt()),
  );
}
