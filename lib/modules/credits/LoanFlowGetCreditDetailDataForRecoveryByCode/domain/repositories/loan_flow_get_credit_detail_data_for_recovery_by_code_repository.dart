import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/entities/loan_flow_get_credit_detail_data_for_recovery_by_code_entity.dart';

abstract class LoanFlowGetCreditDetailDataForRecoveryByCodeRepository {
  Future<LoanFlowGetCreditDetailDataForRecoveryByCodeResponseEntity>loanFlowGetCreDetDatForRecByCode(
    String? vToken,
    String? loanCreditCode,
    String? idSavingAccount,
  );
}