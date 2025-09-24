import 'dart:convert';
import '../../domain/entities/entity.dart';

SavingsAccountTransferMobileResponse
savingsAccountTransferMobileResponseFromJson(String str) =>
    SavingsAccountTransferMobileResponse.fromJson(json.decode(str));

class SavingsAccountTransferMobileResponse
    extends SavingsAccountTransferMobileResponseEntity {
  SavingsAccountTransferMobileResponse({
    required super.data,
    required super.state,
    required super.message,
  });

  factory SavingsAccountTransferMobileResponse.fromJson(
    Map<String, dynamic> json,
  ) => SavingsAccountTransferMobileResponse(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}
