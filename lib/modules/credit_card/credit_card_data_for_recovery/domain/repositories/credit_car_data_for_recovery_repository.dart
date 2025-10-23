import '../entities/entity.dart';

abstract class CreditCarDataForRecoveryRepository {
  Future<CreditCardDataForRecoveryResponseEntity> creditCardDataForRecovery(
    String idCreditLineInstance,
    String creditCardNumber,
    String codeSavingAccountSource,
    String amountOperation,
    int idMoneyOperation,
    String? vToken,
  );
}
