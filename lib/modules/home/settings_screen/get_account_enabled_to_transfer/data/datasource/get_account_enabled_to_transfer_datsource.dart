import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GetAccountEnabledToTransferDatsource {
  final ApiClient _apiClient;
  GetAccountEnabledToTransferDatsource(this._apiClient);

  Future<GetAccountEnabledToTransferResponseEntity> getAccountEnableToTrans(
    String idWebPersonClient,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetAccountEnabledToTransfer',
      operationName: 'phone settings for your account  allied ',
      data: {"idWebPersonClient": idWebPersonClient},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetAccountEnabledToTransferResponse.fromJson(response);
  }

  Future<AccountEnabledToTransferSaveResponseEntity>
  accountenableToTransferSave(
    String idWebPersonClient,
    String idSavingAccount,
    String codeAccount,
    bool isActive,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/AccountEnabledToTransferSave',
      operationName: 'receive transfer by phone number final action',
      data: {
        "IdWebPersonClient": idWebPersonClient,
        "IdSavingAccount": idSavingAccount,
        "CodeAccount": codeAccount,
        "IsActive": isActive,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return AccountEnabledToTransferSaveResponseModel.fromJson(response);
  }
}
