class GetDataAccountForMobilesByCodeAccountAllResponseEntity {
  final List<DataAccountForMobilesByCodeAccountAllEntity> data;
  final int state;
  final String message;

  GetDataAccountForMobilesByCodeAccountAllResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class DataAccountForMobilesByCodeAccountAllEntity {
  final double idSavingsAccount;
  final String codeSavingsAccount;
  final String productName;
  final int idMoney;
  final int accountBalance;
  final int accountAvailableBalance;
  final List<ColDataHolderEntity> colDataHolders;
  final bool isNatural;

  DataAccountForMobilesByCodeAccountAllEntity({
    required this.idSavingsAccount,
    required this.codeSavingsAccount,
    required this.productName,
    required this.idMoney,
    required this.accountBalance,
    required this.accountAvailableBalance,
    required this.colDataHolders,
    required this.isNatural,
  });
}

class ColDataHolderEntity {
  final double idPerson;
  final String identityCardNumber;
  final String holderName;

  ColDataHolderEntity({
    required this.idPerson,
    required this.identityCardNumber,
    required this.holderName,
  });
}
