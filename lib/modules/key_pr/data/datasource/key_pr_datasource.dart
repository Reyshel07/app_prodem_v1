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
  ) async {
    final response = await _apiClient.post(
      'ProdemKey/CreateProdemKey',
      operationName: 'key creation',
      data: {
        "idUser": idUser, //"350880",
        "IdWebOperation": idWebOperation, // "2",
        "Channel": "52238",
        "DeviceIp": "192.168.162.12",
        "DeviceImei": "bd818720bb7f1ec1",
        "DeviceLocation": "context",
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
  ) async {
    final response = await _apiClient.post(
      'ProdemKey/GetProdemKeyById',
      operationName: 'obtains the final key',
      data: {"Location": "context", "IdSmsOperation": idSmsOperation},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetProdemKeyByIdResponseModel.fromJson(response);
  }
}
