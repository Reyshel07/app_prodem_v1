import 'dart:convert';
import '../../domain/entities/entity.dart';

GetAccountEnabledToTransferResponse getAccountEnabledToTransferResponseFromJson(
  String str,
) => GetAccountEnabledToTransferResponse.fromJson(json.decode(str));

class GetAccountEnabledToTransferResponse
    extends GetAccountEnabledToTransferResponseEntity {
  GetAccountEnabledToTransferResponse({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetAccountEnabledToTransferResponse.fromJson(
    Map<String, dynamic> json,
  ) => GetAccountEnabledToTransferResponse(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}

AccountEnabledToTransferSaveResponseModel
accountEnabledToTransferSaveResponseFromJson(String str) =>
    AccountEnabledToTransferSaveResponseModel.fromJson(json.decode(str));

class AccountEnabledToTransferSaveResponseModel
    extends AccountEnabledToTransferSaveResponseEntity {
  AccountEnabledToTransferSaveResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory AccountEnabledToTransferSaveResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => AccountEnabledToTransferSaveResponseModel(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}
