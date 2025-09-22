class SavingsAccountExtractDataTransactionableResponseEntity {
  final DataSavingAccountExtracEntity data;
  final int state;
  final String message;

  SavingsAccountExtractDataTransactionableResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class DataSavingAccountExtracEntity {
  final String codeSavingsAccount;
  final String moneyCode;
  final DateTime processDate;
  final double accountBalance;
  final double accountAvailableBalance;
  final String messageInvoicingProof;
  final List<ColDetailsMovemmentEntity> colDetailsMovemment;
  final List<dynamic> colMovemmentPendings;
  final String message;
  final bool isValid;
  final int idSavingAccount;
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

  DataSavingAccountExtracEntity({
    required this.codeSavingsAccount,
    required this.moneyCode,
    required this.processDate,
    required this.accountBalance,
    required this.accountAvailableBalance,
    required this.messageInvoicingProof,
    required this.colDetailsMovemment,
    required this.colMovemmentPendings,
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

class ColDetailsMovemmentEntity {
  final String reference;
  final DateTime dateTransaction;
  final String descriptionOperation;
  final String officeTransaction;
  final double deposit;
  final double withdrawal;
  final double amountBalance;

  ColDetailsMovemmentEntity({
    required this.reference,
    required this.dateTransaction,
    required this.descriptionOperation,
    required this.officeTransaction,
    required this.deposit,
    required this.withdrawal,
    required this.amountBalance,
  });
}
