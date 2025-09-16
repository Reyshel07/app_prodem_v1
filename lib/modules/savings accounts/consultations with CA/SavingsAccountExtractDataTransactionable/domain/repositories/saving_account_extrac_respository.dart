import '../entities/entity.dart';

abstract class SavingAccountExtracRespository {
  Future<SavingsAccountExtractDataTransactionableResponseEntity>
  savingAccountExtrac(String codeSavingsAccount);
}
