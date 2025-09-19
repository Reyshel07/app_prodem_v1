class GetAccountBalancesResponseEntity {
  final AccountDataEntity data;
  final int state;
  final String message;

  GetAccountBalancesResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class AccountDataEntity {
  final String codeSavingsAccount;
  final String nameOffice;
  final String productName;
  final String moneyCode;
  final DateTime processDate;
  final String holderName;
  final String identityCardNumber;
  final double accountBalance;
  final double accountAvailableBalance;
  final double blockAmount;
  final String stateDescription;
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

  AccountDataEntity({
    required this.codeSavingsAccount,
    required this.nameOffice,
    required this.productName,
    required this.moneyCode,
    required this.processDate,
    required this.holderName,
    required this.identityCardNumber,
    required this.accountBalance,
    required this.accountAvailableBalance,
    required this.blockAmount,
    required this.stateDescription,
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
