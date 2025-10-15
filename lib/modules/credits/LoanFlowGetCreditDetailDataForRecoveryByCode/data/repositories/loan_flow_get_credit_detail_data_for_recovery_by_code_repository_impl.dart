import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/data/datasource/loan_flow_get_credit_detail_data_for_recovery_by_code_datasource.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/entities/loan_flow_get_credit_detail_data_for_recovery_by_code_entity.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/repositories/loan_flow_get_credit_detail_data_for_recovery_by_code_repository.dart';

class LoanFlowGetCreditDetailDataForRecoveryByCodeRepositoryImpl extends LoanFlowGetCreditDetailDataForRecoveryByCodeRepository {

  LoanFlowGetCreditDetailDataForRecoveryByCodeDatasource datasource;
  LoanFlowGetCreditDetailDataForRecoveryByCodeRepositoryImpl ({required this.datasource});

  @override
  Future<LoanFlowGetCreditDetailDataForRecoveryByCodeResponseEntity> loanFlowGetCreDetDatForRecByCode(
    String? vToken,
    String? loanCreditCode,
    String? idSavingAccount
  ){
    return datasource.loanFlowGetCretidDetDatForRecByCode(vToken, loanCreditCode, idSavingAccount);
  }


}