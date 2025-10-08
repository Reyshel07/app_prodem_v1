import 'dart:convert';
import '../../domain/entities/entity.dart';

DecryptQrStringResponseModel decryptQrStringResponseFromJson(String str) =>
    DecryptQrStringResponseModel.fromJson(json.decode(str));

class DecryptQrStringResponseModel extends DecryptQrStringResponseEntity {
  DecryptQrStringResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory DecryptQrStringResponseModel.fromJson(Map<String, dynamic> json) =>
      DecryptQrStringResponseModel(
        data: DExryptQrStringModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class DExryptQrStringModel extends DecryptQrStringEntity {
  DExryptQrStringModel({
    required super.codeQr,
    required super.receiverName,
    required super.receiverIdentityCardNumber,
    required super.bankCode,
    required super.codeAccount,
    required super.codeMoney,
    required super.amount,
    required super.isSingleUse,
    required super.expirationDate,
    required super.codeService,
    required super.reference,
    required super.resultCode,
    required super.errorMessage,
    required super.reportString,
  });

  factory DExryptQrStringModel.fromJson(Map<String, dynamic> json) =>
      DExryptQrStringModel(
        codeQr: json["codeQr"],
        receiverName: json["receiverName"],
        receiverIdentityCardNumber: json["receiverIdentityCardNumber"],
        bankCode: json["bankCode"],
        codeAccount: json["codeAccount"],
        codeMoney: json["codeMoney"],
        amount: json["amount"],
        isSingleUse: json["isSingleUse"],
        expirationDate: DateTime.parse(json["expirationDate"]),
        codeService: json["codeService"],
        reference: json["reference"],
        resultCode: json["resultCode"],
        errorMessage: json["errorMessage"],
        reportString: json["reportString"],
      );
}
