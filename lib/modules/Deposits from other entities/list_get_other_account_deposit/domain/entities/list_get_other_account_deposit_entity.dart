class ListGetOtherAccountDepositResponseEntity {
  final List<ListGetOtherDccountDepositEntity> data;
  final int state;
  final String message;

  ListGetOtherAccountDepositResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class ListGetOtherDccountDepositEntity {
  final String idThirdOnlineDeposit;
  final String idPerson;
  final String idWebOperationReference;
  final int idcState;
  final String state;
  final String codMoney;
  final int monto;
  final String thirdAccount;
  final String thirdName;
  final String accountFunds;
  final String destinationFunds;
  final String depositDate;
  final String sourceFunds;

  ListGetOtherDccountDepositEntity({
    required this.idThirdOnlineDeposit,
    required this.idPerson,
    required this.idWebOperationReference,
    required this.idcState,
    required this.state,
    required this.codMoney,
    required this.monto,
    required this.thirdAccount,
    required this.thirdName,
    required this.accountFunds,
    required this.destinationFunds,
    required this.depositDate,
    required this.sourceFunds,
  });
}
