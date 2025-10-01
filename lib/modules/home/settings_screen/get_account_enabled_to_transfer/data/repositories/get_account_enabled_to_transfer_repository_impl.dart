import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GetAccountEnabledToTransferRepositoryImpl
    extends GetAccountEnabledToTransferRepository {
  GetAccountEnabledToTransferDatsource datasource;
  GetAccountEnabledToTransferRepositoryImpl({required this.datasource});

  @override
  Future<GetAccountEnabledToTransferResponseEntity> getAccountenableToTransfer(
    String idWebPersonClient,
    String? vToken,
  ) async {
    return await datasource.getAccountEnableToTrans(idWebPersonClient, vToken);
  }

  @override
  Future<AccountEnabledToTransferSaveResponseEntity> accountEnableToTransSave(
    String idWebPersonClient,
    String idSavingAccount,
    String codeAccount,
    bool isActive,
    String? vToken,
  ) async {
    return await datasource.accountenableToTransferSave(
      idWebPersonClient,
      idSavingAccount,
      codeAccount,
      isActive,
      vToken,
    );
  }
}
