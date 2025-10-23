class CreditCardDataForRecoveryResponseEntity {
  final CreditCardDataForRecoveryEntity data;
  final int state;
  final String message;

  CreditCardDataForRecoveryResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class CreditCardDataForRecoveryEntity {
  final double idCreditLineSolicitation;
  final String accountNumber;
  final String creditCardNumber;
  final String clientName;
  final double balanceAmount;
  final double minimumPayment;
  final int idLoanCurrency;
  final String loanCurrencyName;
  final double principalBalance;
  final double principalBalanceAtc;
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

  CreditCardDataForRecoveryEntity({
    required this.idCreditLineSolicitation,
    required this.accountNumber,
    required this.creditCardNumber,
    required this.clientName,
    required this.balanceAmount,
    required this.minimumPayment,
    required this.idLoanCurrency,
    required this.loanCurrencyName,
    required this.principalBalance,
    required this.principalBalanceAtc,
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
