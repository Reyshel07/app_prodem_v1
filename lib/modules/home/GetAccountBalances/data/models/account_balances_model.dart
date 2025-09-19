import 'dart:convert';
import '../../domain/entities/entity.dart';

GetAccountBalancesResponseModel getAccountBalancesResponseFromJson(
  String str,
) => GetAccountBalancesResponseModel.fromJson(json.decode(str));

class GetAccountBalancesResponseModel extends GetAccountBalancesResponseEntity {
  GetAccountBalancesResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetAccountBalancesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAccountBalancesResponseModel(
        data: AccountBalancesModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class AccountBalancesModel extends AccountDataEntity {
  AccountBalancesModel({
    required super.codeSavingsAccount,
    required super.nameOffice,
    required super.productName,
    required super.moneyCode,
    required super.processDate,
    required super.holderName,
    required super.identityCardNumber,
    required super.accountBalance,
    required super.accountAvailableBalance,
    required super.blockAmount,
    required super.stateDescription,
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

  factory AccountBalancesModel.fromJson(Map<String, dynamic> json) =>
      AccountBalancesModel(
        codeSavingsAccount: json["codeSavingsAccount"],
        nameOffice: json["nameOffice"],
        productName: json["productName"],
        moneyCode: json["moneyCode"],
        processDate: DateTime.parse(json["processDate"]),
        holderName: json["holderName"],
        identityCardNumber: json["identityCardNumber"],
        accountBalance: json["accountBalance"],
        accountAvailableBalance: json["accountAvailableBalance"],
        blockAmount: json["blockAmount"],
        stateDescription: json["stateDescription"],
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
