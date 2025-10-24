class GetWebBankGuaranteeSolicitationDataResponseEntity {
  final List<GetWebBankGuaranteeSolicitationDataEntity> data;
  final int state;
  final String message;

  GetWebBankGuaranteeSolicitationDataResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetWebBankGuaranteeSolicitationDataEntity {
  final double idSolicitation;
  final String solicitationCode;
  final int idCreditType;
  final String creditTypeName;
  final dynamic shortName;
  final dynamic codeLoanProduct;
  final DateTime solicitationDate;
  final int idCreditAdvisor;
  final dynamic creditAdvisorName;
  final int idAuthorizationRequest;
  final dynamic codeBeneficiary;
  final String beneficiaryName;
  final int idcSolicitationState;
  final String solicitationStateName;
  final double amount;
  final String money;
  final String identificationNumber;
  final String officeName;
  final bool withLoanBriefs;
  final dynamic technologyType;
  final int idTechnologyType;
  final dynamic entityType;
  final bool isCreditLineExtend;
  final int idcDisbursementSolicitationState;
  final dynamic disbursementSolicitationStateName;
  final int idAuthorizationDisbursement;
  final bool isImportSolicitation;
  final bool isMicroCash;
  final int idcPaymentInAdvanceType;
  final dynamic codePaymentFrequency;

  GetWebBankGuaranteeSolicitationDataEntity({
    required this.idSolicitation,
    required this.solicitationCode,
    required this.idCreditType,
    required this.creditTypeName,
    required this.shortName,
    required this.codeLoanProduct,
    required this.solicitationDate,
    required this.idCreditAdvisor,
    required this.creditAdvisorName,
    required this.idAuthorizationRequest,
    required this.codeBeneficiary,
    required this.beneficiaryName,
    required this.idcSolicitationState,
    required this.solicitationStateName,
    required this.amount,
    required this.money,
    required this.identificationNumber,
    required this.officeName,
    required this.withLoanBriefs,
    required this.technologyType,
    required this.idTechnologyType,
    required this.entityType,
    required this.isCreditLineExtend,
    required this.idcDisbursementSolicitationState,
    required this.disbursementSolicitationStateName,
    required this.idAuthorizationDisbursement,
    required this.isImportSolicitation,
    required this.isMicroCash,
    required this.idcPaymentInAdvanceType,
    required this.codePaymentFrequency,
  });
}
