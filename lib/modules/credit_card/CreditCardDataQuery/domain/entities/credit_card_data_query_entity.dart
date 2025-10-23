class CreditCardDataQueryResponseEntity {
  final CreditCardDataQueryEntity data;
  final int state;
  final String message;

  CreditCardDataQueryResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class CreditCardDataQueryEntity {
  final double idCreditLineSolicitation;
  final String accountNumber;
  final String clientName;
  final double creditLineAmount;
  final double balanceAmount;
  final double balanceAvailable;
  final double minimumPayment;
  final String loanCurrencyName;
  final DateTime processDate;
  final double principalBalance;
  final double principalBalanceAtc;
  final List<ColMovementsDetailEntity> colMovementsDetails;

  CreditCardDataQueryEntity({
    required this.idCreditLineSolicitation,
    required this.accountNumber,
    required this.clientName,
    required this.creditLineAmount,
    required this.balanceAmount,
    required this.balanceAvailable,
    required this.minimumPayment,
    required this.loanCurrencyName,
    required this.processDate,
    required this.principalBalance,
    required this.principalBalanceAtc,
    required this.colMovementsDetails,
  });
}

class ColMovementsDetailEntity {
  final String loanCurrencyName;
  final DateTime transactionDate;
  final double transactionAmount;
  final String operationDescription;
  final String operationKind;

  ColMovementsDetailEntity({
    required this.loanCurrencyName,
    required this.transactionDate,
    required this.transactionAmount,
    required this.operationDescription,
    required this.operationKind,
  });
}
