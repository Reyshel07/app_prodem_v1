import 'dart:convert';
import '../../domain/entities/entity.dart';

//two
BankSecuritySolicitationResultResponseModel
bankSecuritySolicitationResultResponseFromJson(String str) =>
    BankSecuritySolicitationResultResponseModel.fromJson(json.decode(str));

class BankSecuritySolicitationResultResponseModel
    extends BankSecuritySolicitationResultResponseEntity {
  BankSecuritySolicitationResultResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory BankSecuritySolicitationResultResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => BankSecuritySolicitationResultResponseModel(
    data: BankSecuritySolicitationResultModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class BankSecuritySolicitationResultModel
    extends BankSecuritySolicitationResultEntity {
  BankSecuritySolicitationResultModel({
    required super.codigoSolicitud,
    required super.moneda,
    required super.montoSolicitado,
    required super.tipoFianza,
    required super.objetoEspecifico,
    required super.validesDesdeHasta,
    required super.beneficiario,
    required super.solicitante,
    required super.documentoOrdenante,
    required super.comisionFianzaBancaria,
  });

  factory BankSecuritySolicitationResultModel.fromJson(
    Map<String, dynamic> json,
  ) => BankSecuritySolicitationResultModel(
    codigoSolicitud: json["codigoSolicitud"],
    moneda: json["moneda"],
    montoSolicitado: json["montoSolicitado"],
    tipoFianza: json["tipoFianza"],
    objetoEspecifico: json["objetoEspecifico"],
    validesDesdeHasta: json["validesDesdeHasta"],
    beneficiario: json["beneficiario"],
    solicitante: json["solicitante"],
    documentoOrdenante: json["documentoOrdenante"],
    comisionFianzaBancaria: json["comisionFianzaBancaria"],
  );
}
