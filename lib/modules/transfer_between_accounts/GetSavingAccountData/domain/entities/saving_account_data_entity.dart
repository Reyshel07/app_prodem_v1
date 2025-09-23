class GetSavingAccountDataResponseEntity {
  final DataSavingAccountEntity data;
  final int state;
  final String message;

  GetSavingAccountDataResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class DataSavingAccountEntity {
  final List<String> colHolders;
  final String uifMessage;
  final String message;
  final bool isValid;
  final String idSavingAccount;
  final double savingBalance;
  final bool applyGenerateConfidentialInformationForm;
  final bool isCloseExecuted;
  final String reportString;
  final dynamic codeSavingAccount;
  final dynamic codeMoney;
  final bool conditionNumberWithdrawalApply;
  final String messageConditionNumberWithdrawal;
  final bool conditionMinimumBalanceApply;
  final String messageConditionMinimumBalance;

  DataSavingAccountEntity({
    required this.colHolders,
    required this.uifMessage,
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
