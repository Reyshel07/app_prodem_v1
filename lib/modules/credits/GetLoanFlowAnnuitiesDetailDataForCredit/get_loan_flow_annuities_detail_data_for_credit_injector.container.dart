import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/data/datasource/get_loan_flow_annuities_detail_data_for_credit_datasource.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/data/repositories/get_loan_flow_annuities_detail_data_for_credit_repository_impl.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/domain/repositories/get_loan_flow_annuities_detail_data_for_credit_repository.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/presentation/bloc/get_loan_flow_annuities_detail_data_for_credit_bloc.dart';
import 'package:get_it/get_it.dart';

void initGetLoanFlowAnnDetDataForCredit(GetIt getIt){
  var apiClient = ApiClient();
getIt.registerLazySingleton(() => GetLoanFlowAnnuitiesDetailDataForCreditDatasource(apiClient));
  getIt.registerFactory<GetLoanFlowAnnuitiesDetailDataForCreditRepository>(
    () => GetLoanFlowAnnuitiesDetailDataForCreditRepositoryImpl(datasource: getIt()),
  );
 getIt.registerFactory(() => GetLoanFlowAnnuitiesDetailDataForCreditBloc(getIt()));
}
