import 'dart:convert';

import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/domain/entities/get_valid_account_entity.dart';

GetValidAccountResponseModel getValidAccountResponseFromJson(String str) =>
    GetValidAccountResponseModel.fromJson(json.decode(str));

class GetValidAccountResponseModel extends GetValidAccountResponseEntity {
  GetValidAccountResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetValidAccountResponseModel.fromJson(Map<String, dynamic> json) =>
      GetValidAccountResponseModel(
        data: GetValidAccountModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class GetValidAccountModel extends GetValidAccountEntity {
  GetValidAccountModel({required super.mensaje, required super.resultado});

  factory GetValidAccountModel.fromJson(Map<String, dynamic> json) =>
      GetValidAccountModel(
        mensaje: json["mensaje"],
        resultado: json["resultado"],
      );
}
