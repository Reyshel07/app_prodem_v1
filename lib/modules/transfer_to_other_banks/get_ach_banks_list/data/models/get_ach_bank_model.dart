import 'dart:convert';
import '../../domain/entities/entity.dart';

GetAchBanksListResponse getAchBanksListResponseFromJson(String str) =>
    GetAchBanksListResponse.fromJson(json.decode(str));

class GetAchBanksListResponse extends GetAchBanksListResponseEntity {
  GetAchBanksListResponse({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetAchBanksListResponse.fromJson(Map<String, dynamic> json) =>
      GetAchBanksListResponse(
        data: GetAchBanckModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class GetAchBanckModel extends GetAchBanckEntity {
  GetAchBanckModel({
    required super.colBanks,
    required super.inactiveBanks,
    required super.colFavorites,
    required super.objParams,
  });

  factory GetAchBanckModel.fromJson(Map<String, dynamic> json) =>
      GetAchBanckModel(
        colBanks: List<ColBankModel>.from(
          json["colBanks"].map((x) => ColBankModel.fromJson(x)),
        ),
        inactiveBanks: json["inactiveBanks"],
        colFavorites: List<dynamic>.from(json["colFavorites"].map((x) => x)),
        objParams: ObjParamsModel.fromJson(json["objParams"]),
      );
}

class ColBankModel extends ColBankEntity {
  ColBankModel({
    required super.idBank,
    required super.bank,
    required super.bankCode,
  });

  factory ColBankModel.fromJson(Map<String, dynamic> json) => ColBankModel(
    idBank: json["idBank"],
    bank: json["bank"],
    bankCode: json["bankCode"],
  );
}

class ObjParamsModel extends ObjParamsEntity {
  ObjParamsModel({
    required super.idParametrosTransInterbank,
    required super.minAmountBs,
    required super.minAmountSus,
    required super.enableShipping,
    required super.message,
  });

  factory ObjParamsModel.fromJson(Map<String, dynamic> json) => ObjParamsModel(
    idParametrosTransInterbank: json["idParametrosTransInterbank"],
    minAmountBs: json["minAmountBs"],
    minAmountSus: json["minAmountSus"],
    enableShipping: json["enableShipping"],
    message: json["message"],
  );
}
