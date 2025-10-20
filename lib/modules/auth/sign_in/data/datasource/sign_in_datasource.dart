import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

class SignInDatasource {
  final ApiClient _apiClient;
  SignInDatasource(this._apiClient);

  Future<SignInResponseEntity> signIn(
    String user,
    String password,
    int channel,
    List<AditionalItemEntity> aditionalItems,
    String ip,
    String imei,
  ) async {
    final response = await _apiClient.post(
      AppStrings.token,
      data: {
        "user": user,
        "password": password,
        "channel": channel,
        "aditionalItems": [
          {"Key": "IP", "Value": ip},
          {"Key": "SmartphoneIMEI", "Value": "ebb6d4e2c9e1485e"},
        ],
      },
      operationName: 'Login',
    );
    return SignInResponseModel.fromJson(response);
  }
}
