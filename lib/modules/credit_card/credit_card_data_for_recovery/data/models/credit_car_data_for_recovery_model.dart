import 'dart:convert';
import '../../domain/entities/entity.dart';

CreditCardDataForRecoveryResponseModel
creditCardDataForRecoveryResponseFromJson(String str) =>
    CreditCardDataForRecoveryResponseModel.fromJson(json.decode(str));

class CreditCardDataForRecoveryResponseModel
    extends CreditCardDataForRecoveryResponseEntity {
  CreditCardDataForRecoveryResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory CreditCardDataForRecoveryResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => CreditCardDataForRecoveryResponseModel(
    data: CreditCardDataForRecoveryModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class CreditCardDataForRecoveryModel extends CreditCardDataForRecoveryEntity {
  CreditCardDataForRecoveryModel({
    required super.idCreditLineSolicitation,
    required super.accountNumber,
    required super.creditCardNumber,
    required super.clientName,
    required super.balanceAmount,
    required super.minimumPayment,
    required super.idLoanCurrency,
    required super.loanCurrencyName,
    required super.principalBalance,
    required super.principalBalanceAtc,
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

  factory CreditCardDataForRecoveryModel.fromJson(Map<String, dynamic> json) =>
      CreditCardDataForRecoveryModel(
        idCreditLineSolicitation: json["idCreditLineSolicitation"].toDouble(),
        accountNumber: json["accountNumber"],
        creditCardNumber: json["creditCardNumber"],
        clientName: json["clientName"],
        balanceAmount: json["balanceAmount"].toDouble(),
        minimumPayment: json["minimumPayment"].toDouble(),
        idLoanCurrency: json["idLoanCurrency"],
        loanCurrencyName: json["loanCurrencyName"],
        principalBalance: json["principalBalance"],
        principalBalanceAtc: json["principalBalanceATC"],
        message: json["message"],
        isValid: json["isValid"],
        idSavingAccount: json["idSavingAccount"],
        savingBalance: json["savingBalance"].toDouble(),
        applyGenerateConfidentialInformationForm:
            json["applyGenerateConfidentialInformationForm"],
        isCloseExecuted: json["isCloseExecuted"],
        reportString: json["reportString"],
        codeSavingAccount: json["codeSavingAccount"],
        codeMoney: json["codeMoney"],
        conditionNumberWithdrawalApply: json["conditionNumberWithdrawalApply"],
        messageConditionNumberWithdrawal:
            json["messageConditionNumberWithdrawal"],
        conditionMinimumBalanceApply: json["conditionMinimumBalanceApply"],
        messageConditionMinimumBalance: json["messageConditionMinimumBalance"],
      );
}
