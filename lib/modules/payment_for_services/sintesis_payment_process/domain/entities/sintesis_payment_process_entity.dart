class SintesisPaymentProcessResponseEntity {
  final SintesisPaymentProcessEntity data;
  final int state;
  final String message;

  SintesisPaymentProcessResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class SintesisPaymentProcessEntity {
  final dynamic voucherData;
  final dynamic voucherLines;
  final String eBillData;
  final bool pendingInvoice;
  final dynamic colEBill;
  final double idTransaction;
  final int idExternalMovement;
  final String reportString;
  final String reportToPrint;
  final String reportToPrintForm;
  final String reportName;
  final String fileName;

  SintesisPaymentProcessEntity({
    required this.voucherData,
    required this.voucherLines,
    required this.eBillData,
    required this.pendingInvoice,
    required this.colEBill,
    required this.idTransaction,
    required this.idExternalMovement,
    required this.reportString,
    required this.reportToPrint,
    required this.reportToPrintForm,
    required this.reportName,
    required this.fileName,
  });
}

///GetSavingAccountVerficationMessagesResponse
class GetSavingAccountVerficationMessagesResponseEntity {
  final GetSavingAccountVerficationMessagesEntity data;
  final int state;
  final String message;

  GetSavingAccountVerficationMessagesResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetSavingAccountVerficationMessagesEntity {
  final String message;
  final bool isValid;
  final String idSavingAccount;
  final int savingBalance;
  final bool applyGenerateConfidentialInformationForm;
  final bool isCloseExecuted;
  final String reportString;
  final dynamic codeSavingAccount;
  final dynamic codeMoney;
  final bool conditionNumberWithdrawalApply;
  final String messageConditionNumberWithdrawal;
  final bool conditionMinimumBalanceApply;
  final String messageConditionMinimumBalance;

  GetSavingAccountVerficationMessagesEntity({
    required this.message,
    required this.isValid,
    required this.idSavingAccount,
    required this.savingBalance,
    required this.applyGenerateConfidentialInformationForm,
    required this.isCloseExecuted,
    required this.reportString,
    required this.codeSavingAccount,
    required this.codeMoney,
    required this.conditionNumberWithdrawalApply,
    required this.messageConditionNumberWithdrawal,
    required this.conditionMinimumBalanceApply,
    required this.messageConditionMinimumBalance,
  });
}
