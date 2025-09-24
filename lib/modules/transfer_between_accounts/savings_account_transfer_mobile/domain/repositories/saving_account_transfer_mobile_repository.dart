import '../entities/entity.dart';

abstract class SavingAccountTransferMobileRepository {
  Future<SavingsAccountTransferMobileResponseEntity> savingAccountTransMobile(
    String codeSavingAccountSource,
    String idPerson,
    String codeSavingAccountTarget,
    String amountTransfer,
    String idMoneyTransfer,
    bool isNaturalCustomer,
    String observation,
    String reasonDestiny,
    bool applyGeneratePCC01,
    String typeApplicationAccessX,
    String depositorName,
    String depositorDI,
    String idTerminal,
    String userAppOriginType,
    String idUser,
    String imei,
    String location,
    String ipAddress,
    String beneficiaryName,
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  );
}
