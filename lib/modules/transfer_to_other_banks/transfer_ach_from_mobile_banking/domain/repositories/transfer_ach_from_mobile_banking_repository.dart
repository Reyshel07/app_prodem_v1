import '../../../../transfer_between_accounts/savings_account_transfer_mobile/domain/entities/entity.dart';

abstract class TransferAchFromMobileBankingRepository {
  Future<SavingsAccountTransferMobileResponseEntity> transferAchFromMobileB(
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  );
}
