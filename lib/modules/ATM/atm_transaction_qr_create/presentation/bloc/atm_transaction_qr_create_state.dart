part of 'atm_transaction_qr_create_bloc.dart';

sealed class AtmTransactionQrCreateState {}

final class AtmTransactionQrCreateInitial extends AtmTransactionQrCreateState {}

final class AtmTransactionQrCreateLoading extends AtmTransactionQrCreateState {}

final class AtmTransactionQrCreateError extends AtmTransactionQrCreateState {
  final String message;
  AtmTransactionQrCreateError(this.message);
}

final class AtmTransactionQrCreateSuccess extends AtmTransactionQrCreateState {
  AtmTransactionQrCreateResponseEntity atmTransactionQrCreateResponseEntity;
  AtmTransactionQrCreateSuccess(this.atmTransactionQrCreateResponseEntity);
}
