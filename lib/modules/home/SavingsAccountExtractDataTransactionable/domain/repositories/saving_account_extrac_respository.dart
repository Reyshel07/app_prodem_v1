import '../entities/entity.dart';

abstract class SavingAccountExtracRespository {
  Future<SavingsAccountExtractDataTransactionableResponseEntity>
  savingAccountExtrac(
    String codeSavingsAccount,
    String idPerson,
    String idUser,
    String? vToken,
    String location
  );
}
