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
  final int idCreditLineSolicitation; // long → int
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
  final List<ColMovementsDetail> colMovementsDetails;

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

class ColMovementsDetail {
  final String loanCurrencyName;
  final DateTime transactionDate;
  final double transactionAmount; // decimal → double
  final String operationDescription;
  final String operationKind;

  ColMovementsDetail({
    required this.loanCurrencyName,
    required this.transactionDate,
    required this.transactionAmount,
    required this.operationDescription,
    required this.operationKind,
  });
}
