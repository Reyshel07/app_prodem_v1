import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/data/datasource/loan_flow_get_credit_detail_data_for_recovery_datasource.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/entities/loan_flow_get_credit_detail_data_for_recovery_entity.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/repositories/loan_flow_get_credit_detail_data_for_recovery_repository.dart';

class LoanFlowGetCreditDetailDataForRecoveryRepositoryImpl extends LoanFlowGetCreditDetailDataForRecoveryRepository {

  LoanFlowGetCreditDetailDataForRecoveryDatasource datasource;
  LoanFlowGetCreditDetailDataForRecoveryRepositoryImpl ({required this.datasource});

  @override
  Future<LoanFlowGetCreditDetailDataForRecoveryResponseEntity> loanFlowGetCreDetDatForRecovery(
    String? vToken,
    String? idLoanCredit,
    String? idSavingAccount
  ){
    return datasource.loanFlowGetCretidDetDatForRecovery(vToken, idLoanCredit, idSavingAccount);
  }
}