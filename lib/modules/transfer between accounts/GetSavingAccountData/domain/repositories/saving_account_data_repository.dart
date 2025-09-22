import '../entities/entity.dart';

abstract class SavingAccountDataRepository {
  Future<GetSavingAccountDataResponseEntity> sanvinAccountData(
    String codeSavingAccountSource,
    String codeSavingAccount,
    int idMoneyOperation,
    String amountOperation,
    String idPerson,
    String? vToken,
  );
}
