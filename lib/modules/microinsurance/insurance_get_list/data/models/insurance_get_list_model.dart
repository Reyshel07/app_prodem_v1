import 'dart:convert';
import '../../domain/entities/entity.dart';

InsuranceGetListResponseModel insuranceGetListResponseFromJson(String str) =>
    InsuranceGetListResponseModel.fromJson(json.decode(str));

class InsuranceGetListResponseModel extends InsuranceGetListResponseEntity {
  InsuranceGetListResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory InsuranceGetListResponseModel.fromJson(Map<String, dynamic> json) =>
      InsuranceGetListResponseModel(
        data: List<InsuranceGetListModel>.from(
          json["data"].map((x) => InsuranceGetListModel.fromJson(x)),
        ),
        state: json["state"],
        message: json["message"],
      );
}

class InsuranceGetListModel extends InsuranceGetListEntity {
  InsuranceGetListModel({
    required super.idInsuranceAnnuity,
    required super.monedaTransaccion,
    required super.nroCertificado,
    required super.montoTransaccion,
    required super.asegurado,
    required super.beneficiarios,
  });

  factory InsuranceGetListModel.fromJson(Map<String, dynamic> json) =>
      InsuranceGetListModel(
        idInsuranceAnnuity: json["idInsuranceAnnuity"],
        monedaTransaccion: json["monedaTransaccion"],
        nroCertificado: json["nroCertificado"],
        montoTransaccion: json["montoTransaccion"],
        asegurado: json["asegurado"],
        beneficiarios: json["beneficiarios"],
      );
}
