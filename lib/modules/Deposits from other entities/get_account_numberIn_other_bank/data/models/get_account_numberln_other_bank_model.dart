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

///GetFavoritesOtherDepositsResponseModel

GetFavoritesOtherDepositsResponseModel
getFavoritesOtherDepositsResponseFromJson(String str) =>
    GetFavoritesOtherDepositsResponseModel.fromJson(json.decode(str));

class GetFavoritesOtherDepositsResponseModel
    extends GetFavoritesOtherDepositsResponseEntity {
  GetFavoritesOtherDepositsResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetFavoritesOtherDepositsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetFavoritesOtherDepositsResponseModel(
    data: List<GetFavoritesOtherDepositsModel>.from(
      json["data"].map((x) => GetFavoritesOtherDepositsModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class GetFavoritesOtherDepositsModel extends GetFavoritesOtherDepositsEntiry {
  GetFavoritesOtherDepositsModel({
    required super.idFavoritosDepositosOtrosBancos,
    required super.idUser,
    required super.nombreDepositante,
    required super.accountOrigin,
    required super.idBankOrigin,
    required super.bankOriginName,
    required super.titular,
  });

  factory GetFavoritesOtherDepositsModel.fromJson(Map<String, dynamic> json) =>
      GetFavoritesOtherDepositsModel(
        idFavoritosDepositosOtrosBancos:
            json["idFavoritosDepositosOtrosBancos"],
        idUser: json["idUser"],
        nombreDepositante: json["nombreDepositante"],
        accountOrigin: json["accountOrigin"],
        idBankOrigin: json["idBankOrigin"],
        bankOriginName: json["bankOriginName"],
        titular: json["titular"],
      );
}
