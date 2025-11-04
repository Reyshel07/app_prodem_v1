import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/bank_security_solicitation_result/data/datasource/bank_security_solicitation_result_datasource.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/bank_security_solicitation_result/data/repositories/bank_security_solicitation_result_repositpory_impl.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/bank_security_solicitation_result/domain/repositories/bank_security_solicitation_result_repository.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/bank_security_solicitation_result/presentation/bloc/bank_security_solicitation_result_bloc.dart';
import 'package:get_it/get_it.dart';

void initBankSecuritySolicitationResult(GetIt getIt) {
  var apiClient = ApiClient();
  getIt.registerLazySingleton(
    () => BankSecuritySolicitationResultDatasource(apiClient),
  );
  getIt.registerFactory<BankSecuritySolicitationResultRepository>(
    () => BankSecuritySolicitationResultRepositporyImpl(datasource: getIt()),
  );
  getIt.registerFactory(() => BankSecuritySolicitationResultBloc(getIt()));
}
