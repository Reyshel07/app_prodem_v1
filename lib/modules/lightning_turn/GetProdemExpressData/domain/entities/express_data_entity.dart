class GetProdemExpressDataResponseEntity {
  final ProdemExpressDataEntity data;
  final int state;
  final String message;

  GetProdemExpressDataResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class ProdemExpressDataEntity {
  final int amountReal;
  final int amountCommision;
  final int amountTax;
  final double amountMAxCai;
  final int idMoney;
  final dynamic moneyDescription;
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

  ProdemExpressDataEntity({
    required this.amountReal,
    required this.amountCommision,
    required this.amountTax,
    required this.amountMAxCai,
    required this.idMoney,
    required this.moneyDescription,
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
