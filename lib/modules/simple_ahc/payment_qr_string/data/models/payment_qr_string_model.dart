import 'dart:convert';
import '../../domain/entities/entity.dart';

PaymentQrStringResponseModel paymentQrStringResponseFromJson(String str) =>
    PaymentQrStringResponseModel.fromJson(json.decode(str));

class PaymentQrStringResponseModel extends PaymentQrStringResponseEntity {
  PaymentQrStringResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory PaymentQrStringResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentQrStringResponseModel(
        data: PaymentQrStringModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class PaymentQrStringModel extends PaymentQrStringEntity {
  PaymentQrStringModel({
    required super.idTransaction,
    required super.resultCode,
    required super.errorMessage,
    required super.reportString,
  });

  factory PaymentQrStringModel.fromJson(Map<String, dynamic> json) =>
      PaymentQrStringModel(
        idTransaction: json["idTransaction"],
        resultCode: json["resultCode"],
        errorMessage: json["errorMessage"],
        reportString: json["reportString"],
      );
}
