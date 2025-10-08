import 'dart:convert';

import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/entities/loan_flow_get_credit_detail_data_for_recovery_entity.dart';

LoanFlowGetCreditDetailDataForRecoveryResponseModel loanFlowGetCreditDetailDataForRecoveryFromJson(String str) => LoanFlowGetCreditDetailDataForRecoveryResponseModel.fromJson(json.decode(str));

class LoanFlowGetCreditDetailDataForRecoveryResponseModel extends LoanFlowGetCreditDetailDataForRecoveryResponseEntity {

    LoanFlowGetCreditDetailDataForRecoveryResponseModel({
        required super.data,
        required super.state,
        required super.message,
    });

    factory LoanFlowGetCreditDetailDataForRecoveryResponseModel.fromJson(Map<String, dynamic> json) => LoanFlowGetCreditDetailDataForRecoveryResponseModel(
        data: LoanFlowGetCreditDetailDataForRecoveryModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
    );


}

class LoanFlowGetCreditDetailDataForRecoveryModel extends LoanFlowGetCreditDetailDataForRecoveryEntity {
    
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

    factory LoanFlowGetCreditDetailDataForRecoveryModel.fromJson(Map<String, dynamic> json) => LoanFlowGetCreditDetailDataForRecoveryModel(
        idLoanCredit: json["idLoanCredit"]?.toDouble(),
        loanCreditCode: json["loanCreditCode"],
        idLoanCurrency: json["idLoanCurrency"],
        loanCurrency: json["loanCurrency"],
        idCreditState: json["idCreditState"],
        creditState: json["creditState"],
        delayDays: json["delayDays"],
        creditBalance: json["creditBalance"]?.toDouble(),
        transitPayments: json["transitPayments"],
        insuranceReturn: json["insuranceReturn"]?.toDouble(),
        totalCreditAmountToPay: json["totalCreditAmountToPay"]?.toDouble(),
        totalAmountToPay: json["totalAmountToPay"]?.toDouble(),
        totalTax: json["totalTax"],
        totalToDebit: json["totalToDebit"]?.toDouble(),
        voluntarySaving: json["voluntarySaving"],
        allAmountRecovery: json["allAmountRecovery"],
        withInsuranceReturn: json["withInsuranceReturn"],
        customerName: json["customerName"],
        identityCard: json["identityCard"],
        idcCreditStateFixedType: json["idcCreditStateFixedType"],
        currentAnnuityToPay: json["currentAnnuityToPay"],
        currentAnnuityEnddingDate: DateTime.parse(json["currentAnnuityEnddingDate"]),
        currentCreditAmountToPay: json["currentCreditAmountToPay"],
        savingAccountCommisionAndTax: json["savingAccountCommisionAndTax"],
        message: json["message"],
        isValid: json["isValid"],
        idSavingAccount: json["idSavingAccount"],
        savingBalance: json["savingBalance"]?.toDouble(),
        applyGenerateConfidentialInformationForm: json["applyGenerateConfidentialInformationForm"],
        isCloseExecuted: json["isCloseExecuted"],
        reportString: json["reportString"],
        codeSavingAccount: json["codeSavingAccount"],
        codeMoney: json["codeMoney"],
        conditionNumberWithdrawalApply: json["conditionNumberWithdrawalApply"],
        messageConditionNumberWithdrawal: json["messageConditionNumberWithdrawal"],
        conditionMinimumBalanceApply: json["conditionMinimumBalanceApply"],
        messageConditionMinimumBalance: json["messageConditionMinimumBalance"],
    );

}
