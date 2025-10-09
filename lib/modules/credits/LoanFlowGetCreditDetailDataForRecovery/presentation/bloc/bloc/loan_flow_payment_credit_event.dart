part of 'loan_flow_payment_credit_bloc.dart';

sealed class LoanFlowPaymentCreditEvent {}

class LoanFlowPaymentCreditE extends LoanFlowPaymentCreditEvent {
  int idLoanCredit;
  double debitAmount;
  double amountToPay;
  double taxAmount;
  int idLoanCurrency;
  bool withInsuranceReturn;
  int idSavingAccount;
  String loanCreditCode;
  bool isOwnCredit;
  //prodemkey
  String? idSMSOperation;
  String? prodemKeyCode;

  LoanFlowPaymentCreditE({
    required this.idLoanCredit,
    required this.debitAmount,
    required this.amountToPay,
    required this.taxAmount,
    required this.idLoanCurrency,
    required this.withInsuranceReturn,
    required this.idSavingAccount,
    required this.loanCreditCode,
    required this.isOwnCredit,
    required this.idSMSOperation,
    required this.prodemKeyCode,
  });
}
