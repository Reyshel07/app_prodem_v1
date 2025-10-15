class GetExternalPaymentGenerateFileByWebClientResponseEntity {
  final List<GetExternalPaymentGenerateFileByWebClientEntity> data;
  final int state;
  final String message;

  GetExternalPaymentGenerateFileByWebClientResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetExternalPaymentGenerateFileByWebClientEntity {
  final double idExternalPaymentGenerateFile;
  final String fileName;
  final String fileType;
  final String fileDescription;
  final String fileData;
  final String voucherData;
  final String displayDate;
  final DateTime serverDate;
  final String channel;
  final double totalPayment;
  final String currencyCode;

  GetExternalPaymentGenerateFileByWebClientEntity({
    required this.idExternalPaymentGenerateFile,
    required this.fileName,
    required this.fileType,
    required this.fileDescription,
    required this.fileData,
    required this.voucherData,
    required this.displayDate,
    required this.serverDate,
    required this.channel,
    required this.totalPayment,
    required this.currencyCode,
  });
}
/*
enum Channel { PRODEM_MVIL }

final channelValues = EnumValues({"ProdemMóvil": Channel.PRODEM_MVIL});

enum CurrencyCode { BS }

final currencyCodeValues = EnumValues({"BS": CurrencyCode.BS});

enum FileDescription {
  PAGO_CRDITO_60211200247,
  TRANSFERENCIA_ACH_1500543910,
  TRANSFERENCIA_CAHO_11721117661,
}

final fileDescriptionValues = EnumValues({
  "Pago crédito: 602-1-1-20024-7": FileDescription.PAGO_CRDITO_60211200247,
  "Transferencia ACH: 1500543910": FileDescription.TRANSFERENCIA_ACH_1500543910,
  "Transferencia CAHO: 117-2-1-11766-1":
      FileDescription.TRANSFERENCIA_CAHO_11721117661,
});

enum FileType { TEXT_PLAIN }

final fileTypeValues = EnumValues({"text/plain": FileType.TEXT_PLAIN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
*/