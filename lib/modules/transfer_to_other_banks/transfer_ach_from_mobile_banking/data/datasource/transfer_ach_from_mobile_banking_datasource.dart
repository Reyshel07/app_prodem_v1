import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/data/models/saving_account_transfer_mobile_model.dart';

import '../../../../transfer_between_accounts/savings_account_transfer_mobile/domain/entities/entity.dart';

class TransferAchFromMobileBankingDatasource {
  final ApiClient _apiClient;
  TransferAchFromMobileBankingDatasource(this._apiClient);

  Future<SavingsAccountTransferMobileResponseEntity> transferAchFromMobileB(
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  ) async {
    final response = await _apiClient.post(
      'Mobile/TransferAchFromMobileBanking  ',
      operationName: 'transfer to other banks final process',
      data: {
        "Beneficiary": "Juan pasten",
        "IdentityCardNumber": "58649564",
        "AccountNumber": "123154645889",
        "CommissionAmount": 0,
        "Observation": "gtggg",
        "IdBankDestiny": "17",
        "IdMoney": "1",
        "IdSavingAccount": "17529542444803121",
        "Amount": "89",
        "AmountSolicitation": 100,
        "IdPerson": "17000000000003984",
        "IdWebPersonClient": "1129150143954615",
        "ApplyGeneratePCC01": false,
        "ReasonDestinyPCC01": "eeee",
        "IdUser": "350880",
        "Imei": "",
        "Location": "",
        "IpAddress": "192.168.1.12",
        "BankDestinyName": "BANCO DE CREDITO",
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
    );
    return SavingsAccountTransferMobileResponse.fromJson(response);
  }
}
