import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/data/models/saving_account_transfer_mobile_model.dart';

import '../../domain/entities/entity.dart';

class SavingAccountTransferMobileDatasource {
  final ApiClient _apiClient;
  SavingAccountTransferMobileDatasource(this._apiClient);

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
    final response = await _apiClient.post(
      'Mobile/SavingsAccountTransferMobile',
      operationName: 'transfer between accounts final process',
      data: {
        "CodeSavingAccountSource": codeSavingAccountSource,
        "IdPerson": idPerson,
        "CodeSavingAccountTarget": codeSavingAccountTarget,
        "AmountTransfer": amountTransfer,
        "IdMoneyTransfer": idMoneyTransfer,
        "IsNaturalCustomer": isNaturalCustomer,
        "Observation": observation,
        "ReasonDestiny": reasonDestiny,
        "ApplyGeneratePCC01": applyGeneratePCC01,
        "TypeApplicationAccessX": typeApplicationAccessX,
        "DepositorName": depositorName,
        "DepositorDI": depositorDI,
        "IdTerminal": idTerminal,
        "UserAppOriginType": userAppOriginType,
        "IdUser": idUser,
        "Imei": imei,
        "Location": location,
        "IpAddress": ipAddress,
        "BeneficiaryName": beneficiaryName,
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
