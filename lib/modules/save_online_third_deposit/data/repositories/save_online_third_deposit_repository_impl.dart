import 'package:app_prodem_v1/modules/save_online_third_deposit/data/datasource/save_online_third_deposit_datasource.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/domain/entities/save_online_third_deposit_entity.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/domain/repositories/save_online_third_deposit_repository.dart';

class SaveOnlineThirdDepositRepositoryImpl
    extends SaveOnlineThirdDepositRepository {
  SaveOnlineThirdDepositDatasource datasource;
  SaveOnlineThirdDepositRepositoryImpl({required this.datasource});

  @override
  Future<SaveOnlineThirdDepositResponseEntity> saveOnlineThirdDeposit(
    String accountDestiny,
    String accountOrigin,
    String ammount,
    String bankOrigin,
    String customerDepositName,
    String depositDate,
    String depositVoucher,
    String destinyOfFunds,
    String idBankOrigin,
    String idMoney,
    String idPerson,
    String idSavingAccount,
    String idThirdOnlineDeposit,
    String idUser,
    String idWebPersonClient,
    String idWebPersonClientCreate,
    String idcOriginType,
    String idcState,
    String identityCardNumber,
    String imei,
    String ipAddress,
    String isOwnAccount,
    String location,
    String moneyCode,
    String nombreCliente,
    String observations,
    String sourceOfFunds,
    String usuarioRegistro,
    String whatsAppNumber,
    String idLoanCredit,
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  ) async {
    return await datasource.saveOnlineThirdDeposit(
      accountDestiny,
      accountOrigin,
      ammount,
      bankOrigin,
      customerDepositName,
      depositDate,
      depositVoucher,
      destinyOfFunds,
      idBankOrigin,
      idMoney,
      idPerson,
      idSavingAccount,
      idThirdOnlineDeposit,
      idUser,
      idWebPersonClient,
      idWebPersonClientCreate,
      idcOriginType,
      idcState,
      identityCardNumber,
      imei,
      ipAddress,
      isOwnAccount,
      location,
      moneyCode,
      nombreCliente,
      observations,
      sourceOfFunds,
      usuarioRegistro,
      whatsAppNumber,
      idLoanCredit,
      vToken,
      idSMSOperation,
      prodemKeyCode,
    );
  }
}
