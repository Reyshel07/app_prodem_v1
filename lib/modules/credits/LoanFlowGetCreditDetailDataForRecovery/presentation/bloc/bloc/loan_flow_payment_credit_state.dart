part of 'loan_flow_payment_credit_bloc.dart';

sealed class LoanFlowPaymentCreditState {}

final class LoanFlowPaymentCreditInitial extends LoanFlowPaymentCreditState {}

final class LoanFlowPaymentCreditLoading extends LoanFlowPaymentCreditState {}

final class LoanFlowPaymentCreditError extends LoanFlowPaymentCreditState {
  final String message;
  LoanFlowPaymentCreditError (this.message);
}


final class LoanFlowPaymentCreditSuccess extends LoanFlowPaymentCreditState {
  final SavingsAccountTransferMobileResponseEntity savingsAccountTransferMobileResponseEntity;
  LoanFlowPaymentCreditSuccess (this.savingsAccountTransferMobileResponseEntity);
}
