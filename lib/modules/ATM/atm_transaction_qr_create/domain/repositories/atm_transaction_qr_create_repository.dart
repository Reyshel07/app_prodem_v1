import '../entities/entity.dart';

abstract class AtmTransactionQrCreateRepository {
  Future<AtmTransactionQrCreateResponseEntity> atmTransactionQrCreate(
    String? vToken,
    String aTMTransactionCode,
    String amountWithdrawn,
    String deviceIdentifier,
    String idATMEntity,
    String idSavingAccount,
    String idUser,
    String idWebClient,
    String ipAddress,
    String location,
    String qRGenerated,
    String? idSMSOperation,
    String? prodemKeyCode,
  );
}
