import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class SavingAccountDataRepositoryImpl extends SavingAccountDataRepository {
  SavingAccountDatasource datasource;
  SavingAccountDataRepositoryImpl({required this.datasource});

  @override
  Future<GetSavingAccountDataResponseEntity> sanvinAccountData(
    String codeSavingAccountSource,
    String codeSavingAccount,
    int idMoneyOperation,
    String amountOperation,
    String idPerson,
    String? vToken,
  ) async {
    return await datasource.savingAccountData(
      codeSavingAccountSource,
      codeSavingAccount,
      idMoneyOperation,
      amountOperation,
      idPerson,
      vToken,
    );
  }
}
