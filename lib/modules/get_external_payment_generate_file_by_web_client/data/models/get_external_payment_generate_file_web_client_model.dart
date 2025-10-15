import 'dart:convert';
import '../../domain/entities/entity.dart';

GetExternalPaymentGenerateFileByWebClientResponseModel
getExternalPaymentGenerateFileByWebClientResponseFromJson(String str) =>
    GetExternalPaymentGenerateFileByWebClientResponseModel.fromJson(
      json.decode(str),
    );

class GetExternalPaymentGenerateFileByWebClientResponseModel
    extends GetExternalPaymentGenerateFileByWebClientResponseEntity {
  GetExternalPaymentGenerateFileByWebClientResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetExternalPaymentGenerateFileByWebClientResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetExternalPaymentGenerateFileByWebClientResponseModel(
    data: (json["data"] is List)
        ? List<GetExternalPaymentGenerateFileByWebClientModel>.from(
            (json["data"] as List).map(
              (x) => GetExternalPaymentGenerateFileByWebClientModel.fromJson(x),
            ),
          )
        : <GetExternalPaymentGenerateFileByWebClientModel>[],
    state: json["state"] ?? 0,
    message: json["message"]?.toString() ?? '',
  );
}

class GetExternalPaymentGenerateFileByWebClientModel
    extends GetExternalPaymentGenerateFileByWebClientEntity {
  GetExternalPaymentGenerateFileByWebClientModel({
    required super.idExternalPaymentGenerateFile,
    required super.fileName,
    required super.fileType,
    required super.fileDescription,
    required super.fileData,
    required super.voucherData,
    required super.displayDate,
    required super.serverDate,
    required super.channel,
    required super.totalPayment,
    required super.currencyCode,
  });

  factory GetExternalPaymentGenerateFileByWebClientModel.fromJson(
    Map<String, dynamic> json,
  ) => GetExternalPaymentGenerateFileByWebClientModel(
    idExternalPaymentGenerateFile: json["idExternalPaymentGenerateFile"]
        .toDouble(),
    fileName: json["fileName"]?.toString() ?? '',
    fileType: json["fileType"]?.toString() ?? '',
    fileDescription: json["fileDescription"],
    fileData: json["fileData"],
    voucherData: json["voucherData"]?.toString() ?? '',
    displayDate: json["displayDate"]?.toString() ?? '',
    serverDate:
        DateTime.tryParse(json["serverDate"]?.toString() ?? '') ??
        DateTime.now(),
    channel: json["channel"],
    totalPayment: json["totalPayment"],
    currencyCode: json["currencyCode"],
  );
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