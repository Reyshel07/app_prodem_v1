import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/key_pr/data/models/key_pr_model.dart';

import '../../domain/entities/entity.dart';

class KeyPrDatasource {
  final ApiClient _apiClient;
  KeyPrDatasource(this._apiClient);

  Future<CreateProdemKeyResponseEntity> createPrKey(
    String idUser,
    String idWebOperation,
    String idWebPersonClient,
    String? vToken,
    String location,
    String ip,
    String imei,
  ) async {
    final response = await _apiClient.post(
      AppStrings.createProdemKey,
      operationName: 'key creation',
      data: {
        "idUser": idUser, //"350880",
        "IdWebOperation": idWebOperation, // "2",
        "Channel": "52238",
        "DeviceIp": ip,
        "DeviceImei": imei,
        "DeviceLocation": location,
        "IdWebPersonClient": idWebPersonClient, //"1129150143954615"
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return CreateProdemKeyResponseModel.fromJson(response);
  }

  Future<GetProdemKeyByIdResponseEntity> getPrKeyById(
    String idSmsOperation,
    String? vToken,
    String location,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getProdemKeyById,
      operationName: 'obtains the final key',
      data: {"Location": location, "IdSmsOperation": idSmsOperation},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetProdemKeyByIdResponseModel.fromJson(response);
  }
}
