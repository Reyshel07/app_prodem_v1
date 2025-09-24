import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/data/datasource/saving_account_transfer_mobile_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';

import '../../domain/repositories/repository.dart';

class SavingAccountTransferMobileRepositoryImpl
    extends SavingAccountTransferMobileRepository {
  SavingAccountTransferMobileDatasource datasource;
  SavingAccountTransferMobileRepositoryImpl({required this.datasource});

  @override
  Future<SavingsAccountTransferMobileResponseEntity> savingAccountTransMobile(
    String codeSavingAccountSource,
    String idPerson,
    String codeSavingAccountTarget,
    String amountTransfer,
    String idMoneyTransfer,
    bool isNaturalCustomer,
    String observation,
    String reasonDestiny,
    bool applyGeneratePCC01,
    String typeApplicationAccessX,
    String depositorName,
    String depositorDI,
    String idTerminal,
    String userAppOriginType,
    String idUser,
    String imei,
    String location,
    String ipAddress,
    String beneficiaryName,
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  ) async {
    return await datasource.savingAccountTransMobile(
      codeSavingAccountSource,
      idPerson,
      codeSavingAccountTarget,
      amountTransfer,
      idMoneyTransfer,
      isNaturalCustomer,
      observation,
      reasonDestiny,
      applyGeneratePCC01,
      typeApplicationAccessX,
      depositorName,
      depositorDI,
      idTerminal,
      userAppOriginType,
      idUser,
      imei,
      location,
      ipAddress,
      beneficiaryName,
      vToken,
      idSMSOperation,
      prodemKeyCode,
    );
  }
}
