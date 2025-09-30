import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class SavingAccountExtracImpl extends SavingAccountExtracRespository {
  SavingAccountExtracDatasource savingAccountExtracDatasource;
  SavingAccountExtracImpl({required this.savingAccountExtracDatasource});

  @override
  Future<SavingsAccountExtractDataTransactionableResponseEntity>
  savingAccountExtrac(
    String codeSavingsAccount,
    String idPerson,
    String idUser,
    String? vToken,
    String location
  ) async {
    return await savingAccountExtracDatasource.savingAccountExtrac(
      codeSavingsAccount,
      idPerson,
      idUser,
      vToken,
      location
    );
  }
}
