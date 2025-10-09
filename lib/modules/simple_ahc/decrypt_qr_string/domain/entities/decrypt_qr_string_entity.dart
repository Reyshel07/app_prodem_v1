class DecryptQrStringResponseEntity {
  final DecryptQrStringEntity data;
  final int state;
  final String message;

  DecryptQrStringResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class DecryptQrStringEntity {
  final String codeQr;
  final String receiverName;
  final String receiverIdentityCardNumber;
  final String bankCode;
  final String codeAccount;
  final String codeMoney;
  final int amount;
  final bool isSingleUse;
  final DateTime expirationDate;
  final String codeService;
  final String reference;
  final int resultCode;
  final String errorMessage;
  final String reportString;

  DecryptQrStringEntity({
    required this.codeQr,
    required this.receiverName,
    required this.receiverIdentityCardNumber,
    required this.bankCode,
    required this.codeAccount,
    required this.codeMoney,
    required this.amount,
    required this.isSingleUse,
    required this.expirationDate,
    required this.codeService,
    required this.reference,
    required this.resultCode,
    required this.errorMessage,
    required this.reportString,
  });
}
