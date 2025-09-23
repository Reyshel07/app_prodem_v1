import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class UserSessionInfoDataSouce {
  final ApiClient _apiClient;
  UserSessionInfoDataSouce(this._apiClient);

  Future<UserSessionInfoResponseEntity> userSession(
    String? vIdWebClient,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/UserSessionInfo',
      data: {
        "IdWebClient": vIdWebClient, // "1129150143954615",
        "deviceIdentifier": "",
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'user information',
    );
    return UserSessionInfoResponseModel.fromJson(response);
  }
}
