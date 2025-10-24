import 'dart:convert';
import '../../domain/entities/entity.dart';

GetWebBankGuaranteeSolicitationDataResponseModel
getWebBankGuaranteeSolicitationDataResponseFromJson(String str) =>
    GetWebBankGuaranteeSolicitationDataResponseModel.fromJson(json.decode(str));

class GetWebBankGuaranteeSolicitationDataResponseModel
    extends GetWebBankGuaranteeSolicitationDataResponseEntity {
  GetWebBankGuaranteeSolicitationDataResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetWebBankGuaranteeSolicitationDataResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetWebBankGuaranteeSolicitationDataResponseModel(
    data: List<GetWebBankGuaranteeSolicitationDataModel>.from(
      json["data"].map(
        (x) => GetWebBankGuaranteeSolicitationDataModel.fromJson(x),
      ),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class GetWebBankGuaranteeSolicitationDataModel
    extends GetWebBankGuaranteeSolicitationDataEntity {
  GetWebBankGuaranteeSolicitationDataModel({
    required super.idSolicitation,
    required super.solicitationCode,
    required super.idCreditType,
    required super.creditTypeName,
    required super.shortName,
    required super.codeLoanProduct,
    required super.solicitationDate,
    required super.idCreditAdvisor,
    required super.creditAdvisorName,
    required super.idAuthorizationRequest,
    required super.codeBeneficiary,
    required super.beneficiaryName,
    required super.idcSolicitationState,
    required super.solicitationStateName,
    required super.amount,
    required super.money,
    required super.identificationNumber,
    required super.officeName,
    required super.withLoanBriefs,
    required super.technologyType,
    required super.idTechnologyType,
    required super.entityType,
    required super.isCreditLineExtend,
    required super.idcDisbursementSolicitationState,
    required super.disbursementSolicitationStateName,
    required super.idAuthorizationDisbursement,
    required super.isImportSolicitation,
    required super.isMicroCash,
    required super.idcPaymentInAdvanceType,
    required super.codePaymentFrequency,
  });

  factory GetWebBankGuaranteeSolicitationDataModel.fromJson(
    Map<String, dynamic> json,
  ) => GetWebBankGuaranteeSolicitationDataModel(
    idSolicitation: json["idSolicitation"].toDouble(),
    solicitationCode: json["solicitationCode"],
    idCreditType: json["idCreditType"],
    creditTypeName: json["creditTypeName"],
    shortName: json["shortName"],
    codeLoanProduct: json["codeLoanProduct"],
    solicitationDate: DateTime.parse(json["solicitationDate"]),
    idCreditAdvisor: json["idCreditAdvisor"],
    creditAdvisorName: json["creditAdvisorName"],
    idAuthorizationRequest: json["idAuthorizationRequest"],
    codeBeneficiary: json["codeBeneficiary"],
    beneficiaryName: json["beneficiaryName"],
    idcSolicitationState: json["idcSolicitationState"],
    solicitationStateName: json["solicitationStateName"],
    amount: json["amount"],
    money: json["money"],
    identificationNumber: json["identificationNumber"],
    officeName: json["officeName"],
    withLoanBriefs: json["withLoanBriefs"],
    technologyType: json["technologyType"],
    idTechnologyType: json["idTechnologyType"],
    entityType: json["entityType"],
    isCreditLineExtend: json["isCreditLineExtend"],
    idcDisbursementSolicitationState: json["idcDisbursementSolicitationState"],
    disbursementSolicitationStateName:
        json["disbursementSolicitationStateName"],
    idAuthorizationDisbursement: json["idAuthorizationDisbursement"],
    isImportSolicitation: json["isImportSolicitation"],
    isMicroCash: json["isMicroCash"],
    idcPaymentInAdvanceType: json["idcPaymentInAdvanceType"],
    codePaymentFrequency: json["codePaymentFrequency"],
  );
}
