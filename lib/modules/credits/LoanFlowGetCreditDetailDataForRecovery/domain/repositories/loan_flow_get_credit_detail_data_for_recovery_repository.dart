import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/entities/loan_flow_get_credit_detail_data_for_recovery_entity.dart';

abstract class LoanFlowGetCreditDetailDataForRecoveryRepository {
  Future<LoanFlowGetCreditDetailDataForRecoveryResponseEntity>loanFlowGetCreDetDatForRecovery(
    String? vToken,
    String? idLoanCredit,
    String? idSavingAccount,
  );
}