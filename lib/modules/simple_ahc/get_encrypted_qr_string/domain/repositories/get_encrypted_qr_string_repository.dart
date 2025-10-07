import '../entities/entity.dart';

abstract class GetEncryptedQrStringRepository {
  Future<GetEncryptedQrStringResponseEntity> getEncryptedQrString(
    String? vToken,
    String idPerson,
    String accountCode,
    String moneyCode,
    String amount,
    bool isUniqueUse,
    String expiredOption,
    String reference,
    String idQuickResponse,
  );
}
