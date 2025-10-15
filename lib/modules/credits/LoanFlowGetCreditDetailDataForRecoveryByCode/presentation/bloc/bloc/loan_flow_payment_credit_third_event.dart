part of 'loan_flow_payment_credit_third_bloc.dart';


sealed class LoanFlowPaymentCreditThirdEvent {}


class LoanFlowPaymentCreditThirdE extends LoanFlowPaymentCreditThirdEvent {
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

  LoanFlowPaymentCreditThirdE({
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
