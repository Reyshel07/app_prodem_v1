import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/data/models/save_online_third_deposit_model.dart';

import '../../domain/entities/entity.dart';

class SaveOnlineThirdDepositDatasource {
  final ApiClient _apiClient;
  SaveOnlineThirdDepositDatasource(this._apiClient);

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
    final response = await _apiClient.post(
      'Mobile/SaveOnlineThirdDeposit',
      operationName: 'final transfer action to other banks ',
      data: {
        "AccountDestiny": "108-2-1-06681-7",
        "AccountOrigin": "1500543910",
        "Ammount": 1500.0,
        "BankOrigin": "BANCO NACIONAL DE BOLIVIA",
        "CustomerDepositName": "JADE PIZA",
        "DepositDate": "13/10/2025",
        "DepositVoucher": "/9j/4AAQSkZJRgABAQAAAQABAAD/",
        "DestinyOfFunds": "Ahorros",
        "IdBankOrigin": 15,
        "IdMoney": 1,
        "IdPerson": "11175880244776760",
        "IdSavingAccount": "11307801599590941",
        "IdThirdOnlineDeposit": "0",
        "IdUser": "350921",
        "IdWebPersonClient": "17112198693298430",
        "IdWebPersonClientCreate": "17112198693298430",
        "IdcOriginType": 14404,
        "IdcState": 18000,
        "IdentityCardNumber": "2446564LP",
        "Imei": "c0556d3b362470ac",
        "IpAddress": "0.0.0.0",
        "IsOwnAccount": true,
        "Location":
            "{\"adminArea\":\"Departamento de La Paz\",\"country\":\"Bolivia\",\"featureName\":\"FVQC+MXQ\",\"latitude\":\"-16.5109489\",\"locality\":\"La Paz\",\"longitude\":\"-68.1276178\",\"subAdminArea\":\"Murillo\",\"subLocality\":\"Macrodistrito Cotahuma\",\"thoroughfare\":\"Belisario Salinas\"}",
        "MoneyCode": "Bs",
        "NombreCliente": "VERA LIMON ABIGAIL DAYANA",
        "Observations": "",
        "SourceOfFunds": "AHORROS POR INGRESOS LABORALES",
        "UsuarioRegistro": "dev001",
        "WhatsAppNumber": "71012857x",
        "IdLoanCredit": "0",
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
    );
    return SaveOnlineThirdDepositResponseModel.fromJson(response);
  }
}
