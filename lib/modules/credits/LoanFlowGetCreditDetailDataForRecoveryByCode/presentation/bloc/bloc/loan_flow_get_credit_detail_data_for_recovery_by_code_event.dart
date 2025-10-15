part of 'loan_flow_get_credit_detail_data_for_recovery_by_code_bloc.dart';

sealed class LoanFlowGetCreditDetailDataForRecoveryByCodeEvent {}

class LoanFlowGetCreditDetailDataForRecoveryByCodeE extends LoanFlowGetCreditDetailDataForRecoveryByCodeEvent {
  String? loanCreditCode;
  String? idSavingAccount;
  LoanFlowGetCreditDetailDataForRecoveryByCodeE({required this.loanCreditCode, required this.idSavingAccount});
}
