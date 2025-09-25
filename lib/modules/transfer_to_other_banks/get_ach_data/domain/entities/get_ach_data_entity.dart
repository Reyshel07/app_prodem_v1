class GetAchDataResponseEntity {
  final GetAchDataEntity data;
  final int state;
  final String message;

  GetAchDataResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetAchDataEntity {
  final int amountReal;
  final int amountCommision;
  final int idMoneyComission;
  final dynamic moneyComissionDescription;
  final int amountTax;
  final int amountMaxLip;
  final int idMoney;
  final String moneyDescription;
  final String idSavingAccount;
  final int savingBalance;
  final bool applyGenerateConfidentialInformationForm;
  final bool conditionNumberWithdrawalApply;
  final String messageConditionNumberWithdrawal;
  final bool conditionMinimumBalanceApply;
  final String messageConditionMinimumBalance;
  final bool isCloseExecuted;

  GetAchDataEntity({
    required this.amountReal,
    required this.amountCommision,
    required this.idMoneyComission,
    required this.moneyComissionDescription,
    required this.amountTax,
    required this.amountMaxLip,
    required this.idMoney,
    required this.moneyDescription,
    required this.idSavingAccount,
    required this.savingBalance,
    required this.applyGenerateConfidentialInformationForm,
    required this.conditionNumberWithdrawalApply,
    required this.messageConditionNumberWithdrawal,
    required this.conditionMinimumBalanceApply,
    required this.messageConditionMinimumBalance,
    required this.isCloseExecuted,
  });
}
