import 'dart:convert';
import '../../domain/entities/entity.dart';

SavingsAccountExtractDataTransactionableResponse
savingsAccountExtractDataTransactionableResponseFromJson(String str) =>
    SavingsAccountExtractDataTransactionableResponse.fromJson(json.decode(str));

class SavingsAccountExtractDataTransactionableResponse
    extends SavingsAccountExtractDataTransactionableResponseEntity {
  SavingsAccountExtractDataTransactionableResponse({
    required super.data,
    required super.state,
    required super.message,
  });

  factory SavingsAccountExtractDataTransactionableResponse.fromJson(
    Map<String, dynamic> json,
  ) => SavingsAccountExtractDataTransactionableResponse(
    data: DataSavingAccountExtracModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class DataSavingAccountExtracModel extends DataSavingAccountExtracEntity {
  DataSavingAccountExtracModel({
    required super.codeSavingsAccount,
    required super.moneyCode,
    required super.processDate,
    required super.accountBalance,
    required super.accountAvailableBalance,
    required super.messageInvoicingProof,
    required super.colDetailsMovemment,
    required super.colMovemmentPendings,
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

  factory DataSavingAccountExtracModel.fromJson(Map<String, dynamic> json) =>
      DataSavingAccountExtracModel(
        codeSavingsAccount: json["codeSavingsAccount"],
        moneyCode: json["moneyCode"],
        processDate: DateTime.parse(json["processDate"]),
        accountBalance: json["accountBalance"]?.toDouble(),
        accountAvailableBalance: json["accountAvailableBalance"]?.toDouble(),
        messageInvoicingProof: json["messageInvoicingProof"],
        colDetailsMovemment: List<ColDetailsMovemmentModel>.from(
          json["colDetailsMovemment"].map(
            (x) => ColDetailsMovemmentModel.fromJson(x),
          ),
        ),
        colMovemmentPendings: List<dynamic>.from(
          json["colMovemmentPendings"].map((x) => x),
        ),
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

class ColDetailsMovemmentModel extends ColDetailsMovemmentEntity {
  ColDetailsMovemmentModel({
    required super.reference,
    required super.dateTransaction,
    required super.descriptionOperation,
    required super.officeTransaction,
    required super.deposit,
    required super.withdrawal,
    required super.amountBalance,
  });

  factory ColDetailsMovemmentModel.fromJson(Map<String, dynamic> json) =>
      ColDetailsMovemmentModel(
        reference: json["reference"],
        dateTransaction: DateTime.parse(json["dateTransaction"]),
        descriptionOperation: json["descriptionOperation"],
        officeTransaction: json["officeTransaction"],
        deposit: json["deposit"]?.toDouble(),
        withdrawal: json["withdrawal"]?.toDouble(),
        amountBalance: json["amountBalance"]?.toDouble(),
      );
}
