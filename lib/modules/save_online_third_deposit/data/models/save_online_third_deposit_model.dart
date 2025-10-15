import 'dart:convert';

import '../../domain/entities/entity.dart';

SaveOnlineThirdDepositResponseModel saveOnlineThirdDepositResponseFromJson(
  String str,
) => SaveOnlineThirdDepositResponseModel.fromJson(json.decode(str));

class SaveOnlineThirdDepositResponseModel
    extends SaveOnlineThirdDepositResponseEntity {
  SaveOnlineThirdDepositResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory SaveOnlineThirdDepositResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => SaveOnlineThirdDepositResponseModel(
    data: SaveOnlineThirdDepositModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class SaveOnlineThirdDepositModel extends SaveOnlineThirdDepositEntity {
  SaveOnlineThirdDepositModel({
    required super.idThirdOnlineDeposit,
    required super.voucherData,
  });

  factory SaveOnlineThirdDepositModel.fromJson(Map<String, dynamic> json) =>
      SaveOnlineThirdDepositModel(
        idThirdOnlineDeposit: json["idThirdOnlineDeposit"],
        voucherData: json["voucherData"],
      );
}
