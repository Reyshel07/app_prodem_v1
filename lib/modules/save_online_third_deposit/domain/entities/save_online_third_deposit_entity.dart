class SaveOnlineThirdDepositResponseEntity {
  final SaveOnlineThirdDepositEntity data;
  final int state;
  final String message;

  SaveOnlineThirdDepositResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class SaveOnlineThirdDepositEntity {
  final int idThirdOnlineDeposit;
  final String voucherData;

  SaveOnlineThirdDepositEntity({
    required this.idThirdOnlineDeposit,
    required this.voucherData,
  });
}
