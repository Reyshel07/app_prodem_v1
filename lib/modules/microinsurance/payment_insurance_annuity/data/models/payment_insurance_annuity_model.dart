import 'dart:convert';
import '../../domain/entities/entity.dart';

PaymentInsuranceAnnuityResponseModel paymentInsuranceAnnuityResponseFromJson(
  String str,
) => PaymentInsuranceAnnuityResponseModel.fromJson(json.decode(str));

class PaymentInsuranceAnnuityResponseModel
    extends PaymentInsuranceAnnuityResponseEntity {
  PaymentInsuranceAnnuityResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory PaymentInsuranceAnnuityResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => PaymentInsuranceAnnuityResponseModel(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}
