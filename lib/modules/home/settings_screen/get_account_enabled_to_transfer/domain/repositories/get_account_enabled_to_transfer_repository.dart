import '../entities/entity.dart';

abstract class GetAccountEnabledToTransferRepository {
  Future<GetAccountEnabledToTransferResponseEntity> getAccountenableToTransfer(
    String idWebPersonClient,
    String? vToken,
  );
  Future<AccountEnabledToTransferSaveResponseEntity> accountEnableToTransSave(
    String idWebPersonClient,
    String idSavingAccount,
    String codeAccount,
    bool isActive,
    String? vToken,
  );
}
