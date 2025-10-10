import 'dart:convert';

import '../../domain/entities/entity.dart';

GetAccountNumberInOtherBankResponseModel
getAccountNumberInOtherBankResponseFromJson(String str) =>
    GetAccountNumberInOtherBankResponseModel.fromJson(json.decode(str));

String getAccountNumberInOtherBankResponseToJson(
  GetAccountNumberInOtherBankResponseModel data,
) => json.encode(data.toJson());

class GetAccountNumberInOtherBankResponseModel
    extends GetAccountNumberInOtherBankResponseEntity {
  GetAccountNumberInOtherBankResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetAccountNumberInOtherBankResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetAccountNumberInOtherBankResponseModel(
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
