class ProdemExpressSaveSolicitationResponseEntity {
  final ProdemExpressSaveSolicitationEntity data;
  final int state;
  final String message;

  ProdemExpressSaveSolicitationResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class ProdemExpressSaveSolicitationEntity {
  final int idProdemExpressSolicitation;
  final String numberTransaccion;
  final int amountTransaction;
  final int idMoneyTransaccion;
  final String moneyTransaccion;
  final int idMoneyAccount;
  final String moneyAccount;
  final int amountDebit;
  final int amountCommision;
  final int amountTax;
  final DateTime dateTransaction;
  final int exchangeRate;
  final bool withCurrencyExchange;
  final String message;
  final bool isValid;
  final String idSavingAccount;
  final int savingBalance;
  final bool applyGenerateConfidentialInformationForm;
  final bool isCloseExecuted;
  final String reportString;
  final String codeSavingAccount;
  final dynamic codeMoney;
  final bool conditionNumberWithdrawalApply;
  final String messageConditionNumberWithdrawal;
  final bool conditionMinimumBalanceApply;
  final String messageConditionMinimumBalance;

  ProdemExpressSaveSolicitationEntity({
    required this.idProdemExpressSolicitation,
    required this.numberTransaccion,
    required this.amountTransaction,
    required this.idMoneyTransaccion,
    required this.moneyTransaccion,
    required this.idMoneyAccount,
    required this.moneyAccount,
    required this.amountDebit,
    required this.amountCommision,
    required this.amountTax,
    required this.dateTransaction,
    required this.exchangeRate,
    required this.withCurrencyExchange,
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
