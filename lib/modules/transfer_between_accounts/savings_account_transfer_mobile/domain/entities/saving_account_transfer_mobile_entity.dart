// To parse this JSON data, do
//
//     final savingsAccountTransferMobileResponse = savingsAccountTransferMobileResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SavingsAccountTransferMobileResponse
savingsAccountTransferMobileResponseFromJson(String str) =>
    SavingsAccountTransferMobileResponse.fromJson(json.decode(str));

String savingsAccountTransferMobileResponseToJson(
  SavingsAccountTransferMobileResponse data,
) => json.encode(data.toJson());

class SavingsAccountTransferMobileResponse {
  final String data;
  final int state;
  final String message;

  SavingsAccountTransferMobileResponse({
    required this.data,
    required this.state,
    required this.message,
  });

  factory SavingsAccountTransferMobileResponse.fromJson(
    Map<String, dynamic> json,
  ) => SavingsAccountTransferMobileResponse(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "state": state,
    "message": message,
  };
}
