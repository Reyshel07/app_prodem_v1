import 'dart:convert';
import '../../domain/entities/entity.dart';

GetProdemExpressDataResponseModel getProdemExpressDataResponseFromJson(
  String str,
) => GetProdemExpressDataResponseModel.fromJson(json.decode(str));

class GetProdemExpressDataResponseModel
    extends GetProdemExpressDataResponseEntity {
  GetProdemExpressDataResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetProdemExpressDataResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetProdemExpressDataResponseModel(
    data: ProdemExpressDataModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class ProdemExpressDataModel extends ProdemExpressDataEntity {
  ProdemExpressDataModel({
    required super.amountReal,
    required super.amountCommision,
    required super.amountTax,
    required super.amountMAxCai,
    required super.idMoney,
    required super.moneyDescription,
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

  factory ProdemExpressDataModel.fromJson(Map<String, dynamic> json) =>
      ProdemExpressDataModel(
        amountReal: json["amountReal"],
        amountCommision: json["amountCommision"],
        amountTax: json["amountTax"],
        amountMAxCai: json["amountMAxCAI"],
        idMoney: json["idMoney"],
        moneyDescription: json["moneyDescription"],
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
        messageConditionNumberWithdrawal:
            json["messageConditionNumberWithdrawal"],
        conditionMinimumBalanceApply: json["conditionMinimumBalanceApply"],
        messageConditionMinimumBalance: json["messageConditionMinimumBalance"],
      );
}
