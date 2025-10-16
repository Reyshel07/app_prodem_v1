import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/data/datasource/payment_qr_string_datasource.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/data/repositories/payment_qr_stringt_repository_impl.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/domain/repositories/payment_qr_string_repository.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/presentation/bloc/payment_qr_string_bloc.dart';
import 'package:get_it/get_it.dart';

void initPaymentQrString(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(() => PaymentQrStringDatasource(apiClient));
  getIt.registerFactory<PaymentQrStringRepository>(
    () => PaymentQrStringtRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<PaymentQrStringBloc>(
    () => PaymentQrStringBloc(getIt()),
  );
}
