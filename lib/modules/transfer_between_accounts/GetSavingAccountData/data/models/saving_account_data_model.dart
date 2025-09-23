import 'dart:convert';
import '../../domain/entities/entity.dart';

GetSavingAccountDataResponseModel getSavingAccountDataResponseFromJson(
  String str,
) => GetSavingAccountDataResponseModel.fromJson(json.decode(str));

class GetSavingAccountDataResponseModel
    extends GetSavingAccountDataResponseEntity {
  GetSavingAccountDataResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetSavingAccountDataResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetSavingAccountDataResponseModel(
    data: DataSavingAccountModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class DataSavingAccountModel extends DataSavingAccountEntity {
  DataSavingAccountModel({
    required super.colHolders,
    required super.uifMessage,
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

  factory DataSavingAccountModel.fromJson(Map<String, dynamic> json) =>
      DataSavingAccountModel(
        colHolders: List<String>.from(json["colHolders"].map((x) => x)),
        uifMessage: json["uifMessage"],
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
