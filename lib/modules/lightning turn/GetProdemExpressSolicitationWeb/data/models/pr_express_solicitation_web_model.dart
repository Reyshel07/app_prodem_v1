import 'dart:convert';
import '../../domain/entities/entity.dart';

GetProdemExpressSolicitationWebResponseModel
getProdemExpressSolicitationWebResponseFromJson(String str) =>
    GetProdemExpressSolicitationWebResponseModel.fromJson(json.decode(str));

class GetProdemExpressSolicitationWebResponseModel
    extends GetProdemExpressSolicitationWebResponseEntity {
  GetProdemExpressSolicitationWebResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetProdemExpressSolicitationWebResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetProdemExpressSolicitationWebResponseModel(
    data: List<PrExpressSolicitationWebModel>.from(
      json["data"].map((x) => PrExpressSolicitationWebModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class PrExpressSolicitationWebModel extends PrExpressSolicitationWebEntity {
  PrExpressSolicitationWebModel({
    required super.idProdemExpressSolicitation,
    required super.solicitationDate,
    required super.officeName,
    required super.moneySolicitation,
    required super.moneyAccount,
    required super.codeSavingsAccount,
    required super.amountTransaction,
    required super.amountCommision,
    required super.amountDebit,
    required super.amountTotalDebit,
    required super.beneficiaryDi,
    required super.beneficiaryName,
    required super.cellPhoneBeneficiary,
  });

  factory PrExpressSolicitationWebModel.fromJson(Map<String, dynamic> json) =>
      PrExpressSolicitationWebModel(
        idProdemExpressSolicitation: json["idProdemExpressSolicitation"],
        solicitationDate: DateTime.parse(json["solicitationDate"]),
        officeName: json["officeName"],
        moneySolicitation: json["moneySolicitation"],
        moneyAccount: json["moneyAccount"],
        codeSavingsAccount: json["codeSavingsAccount"],
        amountTransaction: json["amountTransaction"],
        amountCommision: json["amountCommision"],
        amountDebit: json["amountDebit"],
        amountTotalDebit: json["amountTotalDebit"],
        beneficiaryDi: json["beneficiaryDI"],
        beneficiaryName: json["beneficiaryName"],
        cellPhoneBeneficiary: json["cellPhoneBeneficiary"],
      );
}
