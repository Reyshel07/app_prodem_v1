part of 'loan_flow_payment_credit_third_bloc.dart';


sealed class LoanFlowPaymentCreditThirdState {}

final class LoanFlowPaymentCreditThirdInitial extends LoanFlowPaymentCreditThirdState {}

final class LoanFlowPaymentCreditThirdLoading extends LoanFlowPaymentCreditThirdState {}

final class LoanFlowPaymentCreditThirdError extends LoanFlowPaymentCreditThirdState {
  final String message;
  LoanFlowPaymentCreditThirdError (this.message);
}


final class LoanFlowPaymentCreditThirdSuccess extends LoanFlowPaymentCreditThirdState {
  final SavingsAccountTransferMobileResponseEntity savingsAccountTransferMobileResponseEntity;
  LoanFlowPaymentCreditThirdSuccess (this.savingsAccountTransferMobileResponseEntity);
}
