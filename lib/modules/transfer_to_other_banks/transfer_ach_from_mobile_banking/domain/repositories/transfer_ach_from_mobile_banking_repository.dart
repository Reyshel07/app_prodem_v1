import '../../../../transfer_between_accounts/savings_account_transfer_mobile/domain/entities/entity.dart';

abstract class TransferAchFromMobileBankingRepository {
  Future<SavingsAccountTransferMobileResponseEntity> transferAchFromMobileB(
    String beneficiary,
    String identityCardNumber,
    String accountNumber,
    String commissionAmount,
    String observation,
    String idBankDestiny,
    String idMoney,
    String idSavingAccount,
    String amount,
    String amountSolicitation,
    String idPerson,
    String idWebPersonClient,
    bool applyGeneratePCC01,
    String reasonDestinyPCC01,
    String idUser,
    String imei,
    String location,
    String ipAddress,
    String bankDestinyName,
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  );
}
