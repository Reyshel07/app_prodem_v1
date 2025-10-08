part of 'payment_qr_string_bloc.dart';

sealed class PaymentQrStringState {}

final class PaymentQrStringInitial extends PaymentQrStringState {}

final class PaymentQrStringLoading extends PaymentQrStringState {}

final class PaymentQrStringError extends PaymentQrStringState {
  final String message;
  PaymentQrStringError(this.message);
}

final class PaymentQrStringSuccess extends PaymentQrStringState {
  PaymentQrStringEntity paymentQrStringEntity;
  PaymentQrStringSuccess(this.paymentQrStringEntity);
}
