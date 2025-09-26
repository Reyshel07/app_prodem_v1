import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/data/models/saving_account_transfer_mobile_model.dart';

import '../../../../transfer_between_accounts/savings_account_transfer_mobile/domain/entities/entity.dart';

class TransferAchFromMobileBankingDatasource {
  final ApiClient _apiClient;
  TransferAchFromMobileBankingDatasource(this._apiClient);

  Future<SavingsAccountTransferMobileResponseEntity> transferAchFromMobileB(
    String beneficiary,
    String identityCardNumber,
    String accountNumber,
    String commissionAmount,
    String observation,
    String idBankDestiny,
    String idMoney,
    String idSavingAccount,
    String amount,
    String amountSolicitation,
    String idPerson,
    String idWebPersonClient,
    bool applyGeneratePCC01,
    String reasonDestinyPCC01,
    String idUser,
    String imei,
    String location,
    String ipAddress,
    String bankDestinyName,
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  ) async {
    final response = await _apiClient.post(
      'Mobile/TransferAchFromMobileBanking  ',
      operationName: 'transfer to other banks final process',
      data: {
        "Beneficiary": beneficiary,
        "IdentityCardNumber": identityCardNumber,
        "AccountNumber": accountNumber,
        "CommissionAmount": commissionAmount,
        "Observation": observation,
        "IdBankDestiny": idBankDestiny,
        "IdMoney": idMoney,
        "IdSavingAccount": idSavingAccount,
        "Amount": amount,
        "AmountSolicitation": amountSolicitation,
        "IdPerson": idPerson,
        "IdWebPersonClient": idWebPersonClient,
        "ApplyGeneratePCC01": applyGeneratePCC01,
        "ReasonDestinyPCC01": reasonDestinyPCC01,
        "IdUser": idUser,
        "Imei": imei,
        "Location": location,
        "IpAddress": ipAddress,
        "BankDestinyName": bankDestinyName,
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
