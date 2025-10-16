import 'dart:convert';

import '../../domain/entities/entity.dart';

ProdemExpressSaveSolicitationResponseModel
prodemExpressSaveSolicitationResponseFromJson(String str) =>
    ProdemExpressSaveSolicitationResponseModel.fromJson(json.decode(str));

class ProdemExpressSaveSolicitationResponseModel
    extends ProdemExpressSaveSolicitationResponseEntity {
  ProdemExpressSaveSolicitationResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory ProdemExpressSaveSolicitationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ProdemExpressSaveSolicitationResponseModel(
    data: ProdemExpressSaveSolicitationModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class ProdemExpressSaveSolicitationModel
    extends ProdemExpressSaveSolicitationEntity {
  ProdemExpressSaveSolicitationModel({
    required super.idProdemExpressSolicitation,
    required super.numberTransaccion,
    required super.amountTransaction,
    required super.idMoneyTransaccion,
    required super.moneyTransaccion,
    required super.idMoneyAccount,
    required super.moneyAccount,
    required super.amountDebit,
    required super.amountCommision,
    required super.amountTax,
    required super.dateTransaction,
    required super.exchangeRate,
    required super.withCurrencyExchange,
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

  factory ProdemExpressSaveSolicitationModel.fromJson(
    Map<String, dynamic> json,
  ) => ProdemExpressSaveSolicitationModel(
    idProdemExpressSolicitation: json["idProdemExpressSolicitation"],
    numberTransaccion: json["numberTransaccion"],
    amountTransaction: json["amountTransaction"],
    idMoneyTransaccion: json["idMoneyTransaccion"],
    moneyTransaccion: json["moneyTransaccion"],
    idMoneyAccount: json["idMoneyAccount"],
    moneyAccount: json["moneyAccount"],
    amountDebit: json["amountDebit"],
    amountCommision: json["amountCommision"],
    amountTax: json["amountTax"],
    dateTransaction: DateTime.parse(json["dateTransaction"]),
    exchangeRate: json["exchangeRate"],
    withCurrencyExchange: json["withCurrencyExchange"],
    message: json["message"],
    isValid: json["isValid"],
    idSavingAccount: json["idSavingAccount"],
    savingBalance: json["savingBalance"],
    applyGenerateConfidentialInformationForm:
        json["applyGenerateConfidentialInformationForm"],
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
