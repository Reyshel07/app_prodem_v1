import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/data/datasource/loan_flow_get_credit_detail_data_for_recovery_by_code_datasource.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/data/repositories/loan_flow_get_credit_detail_data_for_recovery_by_code_repository_impl.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/data/repositories/loan_flow_payment_credit_third_repository_impl.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/repositories/loan_flow_get_credit_detail_data_for_recovery_by_code_repository.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/repositories/loan_flow_payment_credit_third_repository.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/presentation/bloc/bloc/loan_flow_get_credit_detail_data_for_recovery_by_code_bloc.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/presentation/bloc/bloc/loan_flow_payment_credit_third_bloc.dart';
import 'package:get_it/get_it.dart';

void initLoanFlowGetCreditDetailDataForRecoveryByCode(GetIt getIt){
  var apiClient = ApiClient();
  getIt.registerSingleton<LoanFlowGetCreditDetailDataForRecoveryByCodeDatasource>(
    LoanFlowGetCreditDetailDataForRecoveryByCodeDatasource(apiClient),
  );
  getIt.registerCachedFactory<LoanFlowGetCreditDetailDataForRecoveryByCodeRepository>(
    ()=> LoanFlowGetCreditDetailDataForRecoveryByCodeRepositoryImpl(datasource: getIt()));
  getIt.registerFactory(()=>LoanFlowGetCreditDetailDataForRecoveryByCodeBloc(getIt()));

  //payment own credit

  getIt.registerCachedFactory<LoanFlowPaymentCreditThirdRepository>(
    ()=> LoanFlowPaymentCreditThirdRepositoryImpl(datasource: getIt()));
    
  getIt.registerFactory(()=>LoanFlowPaymentCreditThirdBloc(getIt()));

}