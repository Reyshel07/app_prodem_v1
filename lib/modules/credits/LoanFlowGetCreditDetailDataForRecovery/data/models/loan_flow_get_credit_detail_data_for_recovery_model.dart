import 'dart:convert';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/entities/loan_flow_get_credit_detail_data_for_recovery_entity.dart';

LoanFlowGetCreditDetailDataForRecoveryResponseModel loanFlowGetCreditDetailDataForRecoveryFromJson(String str) =>
    LoanFlowGetCreditDetailDataForRecoveryResponseModel.fromJson(json.decode(str));

class LoanFlowGetCreditDetailDataForRecoveryResponseModel
    extends LoanFlowGetCreditDetailDataForRecoveryResponseEntity {
  LoanFlowGetCreditDetailDataForRecoveryResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory LoanFlowGetCreditDetailDataForRecoveryResponseModel.fromJson(Map<String, dynamic> json) =>
      LoanFlowGetCreditDetailDataForRecoveryResponseModel(
        data: LoanFlowGetCreditDetailDataForRecoveryModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"] ?? "",
      );
}

class LoanFlowGetCreditDetailDataForRecoveryModel
    extends LoanFlowGetCreditDetailDataForRecoveryEntity {
  LoanFlowGetCreditDetailDataForRecoveryModel({
    required super.idLoanCredit,
    required super.loanCreditCode,
    required super.idLoanCurrency,
    required super.loanCurrency,
    required super.idCreditState,
    required super.creditState,
    required super.delayDays,
    required super.creditBalance,
    required super.transitPayments,
    required super.insuranceReturn,
    required super.totalCreditAmountToPay,
    required super.totalAmountToPay,
    required super.totalTax,
    required super.totalToDebit,
    required super.voluntarySaving,
    required super.allAmountRecovery,
    required super.withInsuranceReturn,
    required super.customerName,
    required super.identityCard,
    required super.idcCreditStateFixedType,
    required super.currentAnnuityToPay,
    required super.currentAnnuityEnddingDate,
    required super.currentCreditAmountToPay,
    required super.savingAccountCommisionAndTax,
    required super.message,
    required super.isValid,
    required super.idSavingAccount,
    required super.savingBalance,
    required super.applyGenerateConfidentialInformationForm,
    required super.isCloseExecuted,
    required super.reportString,
    required super.codeSavingAccount,
    required super.codeMoney,
    required super.conditionNumberWithdrawalApply,
    required super.messageConditionNumberWithdrawal,
    required super.conditionMinimumBalanceApply,
    required super.messageConditionMinimumBalance,
  });

  factory LoanFlowGetCreditDetailDataForRecoveryModel.fromJson(Map<String, dynamic> json) =>
      LoanFlowGetCreditDetailDataForRecoveryModel(
        idLoanCredit: json["idLoanCredit"],
        loanCreditCode: json["loanCreditCode"] ?? "",
        idLoanCurrency: json["idLoanCurrency"],
        loanCurrency: json["loanCurrency"] ?? "",
        idCreditState: json["idCreditState"],
        creditState: json["creditState"] ?? "",
        delayDays: json["delayDays"] ?? 0,
        creditBalance: (json["creditBalance"] ?? 0).toDouble(),
        transitPayments: (json["transitPayments"] ?? 0).toDouble(),
        insuranceReturn: (json["insuranceReturn"] ?? 0).toDouble(),
        totalCreditAmountToPay: (json["totalCreditAmountToPay"] ?? 0).toDouble(),
        totalAmountToPay: (json["totalAmountToPay"] ?? 0).toDouble(),
        totalTax: (json["totalTax"] ?? 0).toDouble(),
        totalToDebit: (json["totalToDebit"] ?? 0).toDouble(),
        voluntarySaving: (json["voluntarySaving"] ?? 0).toDouble(),
        allAmountRecovery: json["allAmountRecovery"] ?? false,
        withInsuranceReturn: json["withInsuranceReturn"] ?? false,
        customerName: json["customerName"] ?? "",
        identityCard: json["identityCard"] ?? "",
        idcCreditStateFixedType: json["idcCreditStateFixedType"] ?? 0,
        currentAnnuityToPay: json["currentAnnuityToPay"] ?? 0,
        currentAnnuityEnddingDate: json["currentAnnuityEnddingDate"] != null
            ? DateTime.tryParse(json["currentAnnuityEnddingDate"])
            : null,
        currentCreditAmountToPay: (json["currentCreditAmountToPay"] ?? 0).toDouble(),
        savingAccountCommisionAndTax: (json["savingAccountCommisionAndTax"] ?? 0).toDouble(),
        // Heredados de DTOResultWebClass
        message: json["message"] ?? "",
        isValid: json["isValid"] ?? false,
        idSavingAccount: json["idSavingAccount"] ?? "",
        savingBalance: (json["savingBalance"] ?? 0).toDouble(),
        applyGenerateConfidentialInformationForm:
            json["applyGenerateConfidentialInformationForm"] ?? false,
        isCloseExecuted: json["isCloseExecuted"] ?? false,
        reportString: json["reportString"] ?? "",
        codeSavingAccount: json["codeSavingAccount"] ?? "",
        codeMoney: json["codeMoney"] ?? "",
        conditionNumberWithdrawalApply: json["conditionNumberWithdrawalApply"] ?? false,
        messageConditionNumberWithdrawal: json["messageConditionNumberWithdrawal"] ?? "",
        conditionMinimumBalanceApply: json["conditionMinimumBalanceApply"] ?? false,
        messageConditionMinimumBalance: json["messageConditionMinimumBalance"] ?? "",
      );
}
