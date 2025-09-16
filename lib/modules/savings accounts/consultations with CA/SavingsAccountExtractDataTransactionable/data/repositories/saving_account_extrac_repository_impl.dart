import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class SavingAccountExtracImpl extends SavingAccountExtracRespository {
  SavingAccountExtracDatasource savingAccountExtracDatasource;
  SavingAccountExtracImpl({required this.savingAccountExtracDatasource});

  @override
  Future<SavingsAccountExtractDataTransactionableResponseEntity>
  savingAccountExtrac(String codeSavingsAccount) async {
    return await savingAccountExtracDatasource.savingAccountExtrac(
      codeSavingsAccount,
    );
  }
}
