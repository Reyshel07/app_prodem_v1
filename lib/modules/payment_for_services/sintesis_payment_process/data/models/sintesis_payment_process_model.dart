import 'dart:convert';
import '../../domain/entities/entity.dart';

SintesisPaymentProcessResponseModel sintesisPaymentProcessResponseFromJson(
  String str,
) => SintesisPaymentProcessResponseModel.fromJson(json.decode(str));

class SintesisPaymentProcessResponseModel
    extends SintesisPaymentProcessResponseEntity {
  SintesisPaymentProcessResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory SintesisPaymentProcessResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => SintesisPaymentProcessResponseModel(
    data: SintesisPaymentProcessModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class SintesisPaymentProcessModel extends SintesisPaymentProcessEntity {
  SintesisPaymentProcessModel({
    required super.voucherData,
    required super.voucherLines,
    required super.eBillData,
    required super.pendingInvoice,
    required super.colEBill,
    required super.idTransaction,
    required super.idExternalMovement,
    required super.reportString,
    required super.reportToPrint,
    required super.reportToPrintForm,
    required super.reportName,
    required super.fileName,
  });

  factory SintesisPaymentProcessModel.fromJson(Map<String, dynamic> json) =>
      SintesisPaymentProcessModel(
        voucherData: json["voucherData"],
        voucherLines: json["voucherLines"],
        eBillData: json["eBillData"],
        pendingInvoice: json["pendingInvoice"],
        colEBill: json["colEBill"],
        idTransaction: json["idTransaction"].toDouble(),
        idExternalMovement: json["idExternalMovement"],
        reportString: json["reportString"],
        reportToPrint: json["reportToPrint"],
        reportToPrintForm: json["reportToPrintForm"],
        reportName: json["reportName"],
        fileName: json["fileName"],
      );
}

///GetSavingAccountVerficationMessagesResponse
GetSavingAccountVerficationMessagesResponseModel
getSavingAccountVerficationMessagesResponseFromJson(String str) =>
    GetSavingAccountVerficationMessagesResponseModel.fromJson(json.decode(str));

class GetSavingAccountVerficationMessagesResponseModel
    extends GetSavingAccountVerficationMessagesResponseEntity {
  GetSavingAccountVerficationMessagesResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetSavingAccountVerficationMessagesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetSavingAccountVerficationMessagesResponseModel(
    data: GetSavingAccountVerficationMessagesModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class GetSavingAccountVerficationMessagesModel
    extends GetSavingAccountVerficationMessagesEntity {
  GetSavingAccountVerficationMessagesModel({
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

  factory GetSavingAccountVerficationMessagesModel.fromJson(
    Map<String, dynamic> json,
  ) => GetSavingAccountVerficationMessagesModel(
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
