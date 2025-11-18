import 'dart:convert';

import '../../domain/entities/entity.dart';

GetCurrentSmsOperationResponseModel getCurrentSmsOperationResponseFromJson(
  String str,
) => GetCurrentSmsOperationResponseModel.fromJson(json.decode(str));

class GetCurrentSmsOperationResponseModel
    extends GetCurrentSmsOperationResponseEntity {
  GetCurrentSmsOperationResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetCurrentSmsOperationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetCurrentSmsOperationResponseModel(
    data: GetCurrentSmsOperationModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class GetCurrentSmsOperationModel extends GetCurrentSmsOperationEntity {
  GetCurrentSmsOperationModel({
    required super.idSmsOperacion,
    required super.transactionDetail,
    required super.locationData,
  });

  factory GetCurrentSmsOperationModel.fromJson(Map<String, dynamic> json) =>
      GetCurrentSmsOperationModel(
        idSmsOperacion: json["idSmsOperacion"],
        transactionDetail: json["transactionDetail"],
        locationData: json["locationData"],
      );
}
