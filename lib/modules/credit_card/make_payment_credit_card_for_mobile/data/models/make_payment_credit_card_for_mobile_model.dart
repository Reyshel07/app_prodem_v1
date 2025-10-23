import 'dart:convert';

import '../../domain/entities/entity.dart';

MakePaymentCreditCardForMobileResponse
makePaymentCreditCardForMobileResponseFromJson(String str) =>
    MakePaymentCreditCardForMobileResponse.fromJson(json.decode(str));

class MakePaymentCreditCardForMobileResponse
    extends MakePaymentCreditCardForMobileResponseEntity {
  MakePaymentCreditCardForMobileResponse({
    required super.data,
    required super.state,
    required super.message,
  });

  factory MakePaymentCreditCardForMobileResponse.fromJson(
    Map<String, dynamic> json,
  ) => MakePaymentCreditCardForMobileResponse(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}
