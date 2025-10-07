import 'dart:convert';

import '../../domain/entities/entity.dart';

GetEncryptedQrStringResponseModel getEncryptedQrStringResponseFromJson(
  String str,
) => GetEncryptedQrStringResponseModel.fromJson(json.decode(str));

class GetEncryptedQrStringResponseModel
    extends GetEncryptedQrStringResponseEntity {
  GetEncryptedQrStringResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetEncryptedQrStringResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetEncryptedQrStringResponseModel(
    data: GETEncryptedQrStringModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class GETEncryptedQrStringModel extends GetEncryptedQrStringEntity {
  GETEncryptedQrStringModel({
    required super.idQuickResponse,
    required super.qrValue,
    required super.qrImage,
    required super.qrpdfFile,
    required super.resultCode,
    required super.errorMessage,
    required super.reportString,
  });

  factory GETEncryptedQrStringModel.fromJson(Map<String, dynamic> json) =>
      GETEncryptedQrStringModel(
        idQuickResponse: json["idQuickResponse"],
        qrValue: json["qrValue"],
        qrImage: json["qrImage"],
        qrpdfFile: json["qrpdfFile"],
        resultCode: json["resultCode"],
        errorMessage: json["errorMessage"],
        reportString: json["reportString"],
      );
}
