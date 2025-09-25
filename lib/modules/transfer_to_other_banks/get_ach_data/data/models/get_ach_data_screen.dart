import 'dart:convert';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/domain/entities/get_ach_data_entity.dart';

GetAchDataResponseModel getAchDataResponseFromJson(String str) =>
    GetAchDataResponseModel.fromJson(json.decode(str));

class GetAchDataResponseModel extends GetAchDataResponseEntity {
  GetAchDataResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetAchDataResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAchDataResponseModel(
        data: GetAchDataModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class GetAchDataModel extends GetAchDataEntity {
  GetAchDataModel({
    required super.amountReal,
    required super.amountCommision,
    required super.idMoneyComission,
    required super.moneyComissionDescription,
    required super.amountTax,
    required super.amountMaxLip,
    required super.idMoney,
    required super.moneyDescription,
    required super.idSavingAccount,
    required super.savingBalance,
    required super.applyGenerateConfidentialInformationForm,
    required super.conditionNumberWithdrawalApply,
    required super.messageConditionNumberWithdrawal,
    required super.conditionMinimumBalanceApply,
    required super.messageConditionMinimumBalance,
    required super.isCloseExecuted,
  });

  factory GetAchDataModel.fromJson(Map<String, dynamic> json) =>
      GetAchDataModel(
        amountReal: json["amountReal"],
        amountCommision: json["amountCommision"],
        idMoneyComission: json["idMoneyComission"],
        moneyComissionDescription: json["moneyComissionDescription"],
        amountTax: json["amountTax"],
        amountMaxLip: json["amountMaxLIP"],
        idMoney: json["idMoney"],
        moneyDescription: json["moneyDescription"],
        idSavingAccount: json["idSavingAccount"],
        savingBalance: json["savingBalance"],
        applyGenerateConfidentialInformationForm:
            json["applyGenerateConfidentialInformationForm"],
        conditionNumberWithdrawalApply: json["conditionNumberWithdrawalApply"],
        messageConditionNumberWithdrawal:
            json["messageConditionNumberWithdrawal"],
        conditionMinimumBalanceApply: json["conditionMinimumBalanceApply"],
        messageConditionMinimumBalance: json["messageConditionMinimumBalance"],
        isCloseExecuted: json["isCloseExecuted"],
      );
}
