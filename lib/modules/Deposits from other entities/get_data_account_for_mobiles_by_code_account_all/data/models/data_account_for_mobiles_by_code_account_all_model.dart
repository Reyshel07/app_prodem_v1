import 'dart:convert';
import '../../domain/entities/entity.dart';

GetDataAccountForMobilesByCodeAccountAllResponseModel
getDataAccountForMobilesByCodeAccountAllResponseFromJson(String str) =>
    GetDataAccountForMobilesByCodeAccountAllResponseModel.fromJson(
      json.decode(str),
    );

class GetDataAccountForMobilesByCodeAccountAllResponseModel
    extends GetDataAccountForMobilesByCodeAccountAllResponseEntity {
  GetDataAccountForMobilesByCodeAccountAllResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetDataAccountForMobilesByCodeAccountAllResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetDataAccountForMobilesByCodeAccountAllResponseModel(
    data: List<DataAccountForMobilesByCodeAccountAllModel>.from(
      json["data"].map(
        (x) => DataAccountForMobilesByCodeAccountAllModel.fromJson(x),
      ),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class DataAccountForMobilesByCodeAccountAllModel
    extends DataAccountForMobilesByCodeAccountAllEntity {
  DataAccountForMobilesByCodeAccountAllModel({
    required super.idSavingsAccount,
    required super.codeSavingsAccount,
    required super.productName,
    required super.idMoney,
    required super.accountBalance,
    required super.accountAvailableBalance,
    required super.colDataHolders,
    required super.isNatural,
  });

  factory DataAccountForMobilesByCodeAccountAllModel.fromJson(
    Map<String, dynamic> json,
  ) => DataAccountForMobilesByCodeAccountAllModel(
    idSavingsAccount: json["idSavingsAccount"].toDouble(),
    codeSavingsAccount: json["codeSavingsAccount"],
    productName: json["productName"],
    idMoney: json["idMoney"],
    accountBalance: json["accountBalance"],
    accountAvailableBalance: json["accountAvailableBalance"],
    colDataHolders: List<ColDataHolderModel>.from(
      json["colDataHolders"].map((x) => ColDataHolderModel.fromJson(x)),
    ),
    isNatural: json["isNatural"],
  );
}

class ColDataHolderModel extends ColDataHolderEntity {
  ColDataHolderModel({
    required super.idPerson,
    required super.identityCardNumber,
    required super.holderName,
  });

  factory ColDataHolderModel.fromJson(Map<String, dynamic> json) =>
      ColDataHolderModel(
        idPerson: json["idPerson"].toDouble(),
        identityCardNumber: json["identityCardNumber"],
        holderName: json["holderName"],
      );
}
