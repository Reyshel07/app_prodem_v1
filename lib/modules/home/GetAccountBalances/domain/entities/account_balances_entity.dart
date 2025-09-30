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
  final String? stateDescription;  

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
    required this.stateDescription    
  });
}
