import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class WebPersonDeviceAuthenticatePrKyDatasource {
  final ApiClient _apiClient;
  WebPersonDeviceAuthenticatePrKyDatasource(this._apiClient);

  Future<WebPersonDeviceAuthenticateProdemKeyResponseEntity>
  webPersonDeviceAuthenticateProdemKey(
    String deviceIMEI,
    String userName,
    String customerPIN,
    bool verifyPIN,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.webPersonDeviceAuthenticateProdemKey,
      operationName: 'service that validates the PIN sent by the user ',
      data: {
        "deviceIMEI": deviceIMEI,
        "userName": userName,
        "customerPIN": customerPIN,
        "verifyPIN": verifyPIN,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return WebPersonDeviceAuthenticateProdemKeyResponseModel.fromJson(response);
  }
}
