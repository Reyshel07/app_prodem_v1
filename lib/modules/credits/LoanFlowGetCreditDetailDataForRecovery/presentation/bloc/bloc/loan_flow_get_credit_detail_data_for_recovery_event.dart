part of 'loan_flow_get_credit_detail_data_for_recovery_bloc.dart';

sealed class LoanFlowGetCreditDetailDataForRecoveryEvent {}

class LoanFlowGetCredDetDatForRecoveryEvent extends LoanFlowGetCreditDetailDataForRecoveryEvent {
  String? idLoanCredit;
  String? idSavingAccount;

  LoanFlowGetCredDetDatForRecoveryEvent ({required this.idLoanCredit,required this.idSavingAccount });
}