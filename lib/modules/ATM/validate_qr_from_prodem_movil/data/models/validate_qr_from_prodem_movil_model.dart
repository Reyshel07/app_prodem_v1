import 'dart:convert';

import '../../domain/entities/entity.dart';

ValidateQrFromProdemMovilResponseModel
validateQrFromProdemMovilResponseFromJson(String str) =>
    ValidateQrFromProdemMovilResponseModel.fromJson(json.decode(str));

class ValidateQrFromProdemMovilResponseModel
    extends ValidateQrFromProdemMovilResponseEntity {
  ValidateQrFromProdemMovilResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory ValidateQrFromProdemMovilResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ValidateQrFromProdemMovilResponseModel(
    data: ValidateQrFromProdemMovilModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class ValidateQrFromProdemMovilModel extends ValidateQrFromProdemMovilEntity {
  ValidateQrFromProdemMovilModel({
    required super.idAtm,
    required super.atmName,
    required super.idTransactionAtm,
    required super.qRuuid,
    required super.colCuts,
  });

  factory ValidateQrFromProdemMovilModel.fromJson(Map<String, dynamic> json) =>
      ValidateQrFromProdemMovilModel(
        idAtm: json["idATM"],
        atmName: json["atmName"],
        idTransactionAtm: json["idTransactionATM"],
        qRuuid: json["qRuuid"],
        colCuts: List<int>.from(json["colCuts"].map((x) => x)),
      );
}
