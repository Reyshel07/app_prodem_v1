class PaymentQrStringResponseEntity {
  final PaymentQrStringEntity data;
  final int state;
  final String message;

  PaymentQrStringResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class PaymentQrStringEntity {
  final String idTransaction;
  final int resultCode;
  final String errorMessage;
  final String reportString;

  PaymentQrStringEntity({
    required this.idTransaction,
    required this.resultCode,
    required this.errorMessage,
    required this.reportString,
  });
}
