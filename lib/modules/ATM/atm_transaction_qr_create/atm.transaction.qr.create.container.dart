import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/data/datasource/atm_transaction_qr_create_datasource.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/data/repositories/atm_transaction_qr_create_repository_impl.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/domain/repositories/atm_transaction_qr_create_repository.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/presentation/bloc/atm_transaction_qr_create_bloc.dart';
import 'package:get_it/get_it.dart';

void initAtmTransactionQrCreate(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => AtmTransactionQrCreateDatasource(apiClient),
  );
  getIt.registerFactory<AtmTransactionQrCreateRepository>(
    () => AtmTransactionQrCreateRepositoryImpl(datasource: getIt()),
  );
  getIt.registerFactory<AtmTransactionQrCreateBloc>(
    () => AtmTransactionQrCreateBloc(getIt()),
  );
}
