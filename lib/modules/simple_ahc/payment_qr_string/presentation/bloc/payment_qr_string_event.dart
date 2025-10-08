part of 'payment_qr_string_bloc.dart';

sealed class PaymentQrStringEvent {}

class PaymentQrEvent extends PaymentQrStringEvent {
  final String codeQr;
  final String receiverName;
  final String receiverIdentityCardNumber;
  final String bankCode;
  final String codeAccountDestiny;
  final String codeMoney;
  final String amount;
  final String isSingleUse;
  final String expirationDate;
  final String codeService;
  final String reference;
  final String stringQr;
  final String codePaymentAccount;
  PaymentQrEvent({
    required this.codeQr,
    required this.receiverName,
    required this.receiverIdentityCardNumber,
    required this.bankCode,
    required this.codeAccountDestiny,
    required this.codeMoney,
    required this.amount,
    required this.isSingleUse,
    required this.codePaymentAccount,
    required this.codeService,
    required this.expirationDate,
    required this.reference,
    required this.stringQr,
  });
}
