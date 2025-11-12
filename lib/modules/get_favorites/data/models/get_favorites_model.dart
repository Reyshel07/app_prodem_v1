import 'dart:convert';
import '../../domain/entities/entity.dart';

GetFavoritesResponseModel getFavoritesResponseFromJson(String str) =>
    GetFavoritesResponseModel.fromJson(json.decode(str));

class GetFavoritesResponseModel extends GetFavoritesResponseEntity {
  GetFavoritesResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetFavoritesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetFavoritesResponseModel(
        data: List<GetFavoritesModel>.from(
          json["data"].map((x) => GetFavoritesModel.fromJson(x)),
        ),
        state: json["state"],
        message: json["message"],
      );
}

class GetFavoritesModel extends GetFavoritesEntity {
  GetFavoritesModel({
    required super.idCuentasUsadas,
    required super.beneficiario,
    required super.cuentaDestino,
    required super.ciBeneficiario,
    required super.celularDestino,
    required super.idBancoDestino,
    required super.textFavorito,
  });

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) =>
      GetFavoritesModel(
        idCuentasUsadas: json["idCuentasUsadas"],
        beneficiario: json["beneficiario"],
        cuentaDestino: json["cuentaDestino"],
        ciBeneficiario: json["ciBeneficiario"],
        celularDestino: json["celularDestino"],
        idBancoDestino: json["idBancoDestino"],
        textFavorito: json["textFavorito"],
      );
}
