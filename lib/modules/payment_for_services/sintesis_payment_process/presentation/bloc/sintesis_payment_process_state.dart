part of 'sintesis_payment_process_bloc.dart';

sealed class SintesisPaymentProcessState {}

final class SintesisPaymentProcessInitial extends SintesisPaymentProcessState {}

final class SintesisPaymentProcessLoading extends SintesisPaymentProcessState {}

final class SintesisPaymentProcessError extends SintesisPaymentProcessState {
  final String message;
  SintesisPaymentProcessError(this.message);
}

final class SintesisPaymentProcessSuccess extends SintesisPaymentProcessState {
  SintesisPaymentProcessResponseEntity sintesisPaymentProcessResponseEntity;
  SintesisPaymentProcessSuccess(this.sintesisPaymentProcessResponseEntity);
}
