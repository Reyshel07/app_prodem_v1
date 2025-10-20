import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/data/models/atm_transaction_qr_create_model.dart';

import '../../domain/entities/entity.dart';

class AtmTransactionQrCreateDatasource {
  final ApiClient _apiClient;
  AtmTransactionQrCreateDatasource(this._apiClient);

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
    final response = await _apiClient.post(
      AppStrings.atmTransactionQrCreate,
      operationName: 'service that records ATM withdrawals without a card',
      data: {
        "ATMTransactionCode": aTMTransactionCode,
        "AmountWithdrawn": amountWithdrawn,
        "DeviceIdentifier": deviceIdentifier,
        "IdATMEntity": idATMEntity,
        "IdSavingAccount": idSavingAccount,
        "IdUser": idUser,
        "IdWebClient": idWebClient,
        "IpAddress": ipAddress,
        "Location": location,
        "QRGenerated": qRGenerated,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
    );
    return AtmTransactionQrCreateResponseModel.fromJson(response);
  }
}
