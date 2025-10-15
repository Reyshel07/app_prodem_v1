import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/data/datasource/loan_flow_get_credit_detail_data_for_recovery_datasource.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/data/repositories/loan_flow_get_credit_detail_data_for_recovery_repository_impl.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/data/repositories/loan_flow_payment_credit_repository_impl.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/repositories/loan_flow_get_credit_detail_data_for_recovery_repository.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/repositories/loan_flow_payment_credit_repository.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/presentation/bloc/bloc/loan_flow_get_credit_detail_data_for_recovery_bloc.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/presentation/bloc/bloc/loan_flow_payment_credit_bloc.dart';
import 'package:get_it/get_it.dart';

void initLoanFlowGetCreditDetailDataForRecovery(GetIt getIt){
  var apiClient = ApiClient();
  getIt.registerSingleton<LoanFlowGetCreditDetailDataForRecoveryDatasource>(
    LoanFlowGetCreditDetailDataForRecoveryDatasource(apiClient),
  );
  getIt.registerCachedFactory<LoanFlowGetCreditDetailDataForRecoveryRepository>(
    ()=> LoanFlowGetCreditDetailDataForRecoveryRepositoryImpl(datasource: getIt()));
  getIt.registerFactory(()=>LoanFlowGetCreditDetailDataForRecoveryBloc(getIt()));

  //payment own credit

  getIt.registerCachedFactory<LoanFlowPaymentCreditRepository>(
    ()=> LoanFlowPaymentCreditRepositoryImpl(datasource: getIt()));
    
  getIt.registerFactory(()=>LoanFlowPaymentCreditBloc(getIt()));

}