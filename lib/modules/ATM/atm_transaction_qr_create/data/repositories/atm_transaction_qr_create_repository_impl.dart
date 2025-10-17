import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/data/datasource/atm_transaction_qr_create_datasource.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/domain/entities/atm_transaction_qr_create_entity.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/domain/repositories/atm_transaction_qr_create_repository.dart';

class AtmTransactionQrCreateRepositoryImpl
    extends AtmTransactionQrCreateRepository {
  AtmTransactionQrCreateDatasource datasource;
  AtmTransactionQrCreateRepositoryImpl({required this.datasource});

  @override
  Future<AtmTransactionQrCreateResponseEntity> atmTransactionQrCreate(
    String? vToken,
    String aTMTransactionCode,
    String amountWithdrawn,
    String deviceIdentifier,
    String idATMEntity,
    String idSavingAccount,
    String idUser,
    String idWebClient,
    String ipAddress,
    String location,
    String qRGenerated,
    String? idSMSOperation,
    String? prodemKeyCode,
  ) async {
    return await datasource.atmTransactionQrCreate(
      vToken,
      aTMTransactionCode,
      amountWithdrawn,
      deviceIdentifier,
      idATMEntity,
      idSavingAccount,
      idUser,
      idWebClient,
      ipAddress,
      location,
      qRGenerated,
      idSMSOperation,
      prodemKeyCode,
    );
  }
}
