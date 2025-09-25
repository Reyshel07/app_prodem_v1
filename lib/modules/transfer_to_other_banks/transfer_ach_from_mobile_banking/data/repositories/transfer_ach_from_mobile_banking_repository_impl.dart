import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/data/datasource/transfer_ach_from_mobile_banking_datasource.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/domain/repositories/transfer_ach_from_mobile_banking_repository.dart';

class TransferAchFromMobileBankingRepositoryImpl
    extends TransferAchFromMobileBankingRepository {
  TransferAchFromMobileBankingDatasource datasource;
  TransferAchFromMobileBankingRepositoryImpl({required this.datasource});

  @override
  Future<SavingsAccountTransferMobileResponseEntity> transferAchFromMobileB(
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  ) async {
    return await datasource.transferAchFromMobileB(
      vToken,
      idSMSOperation,
      prodemKeyCode,
    );
  }
}
