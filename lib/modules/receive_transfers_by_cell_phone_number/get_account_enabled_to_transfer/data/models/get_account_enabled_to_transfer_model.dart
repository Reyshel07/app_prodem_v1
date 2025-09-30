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
