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
  ) async {
    final response = await _apiClient.post(
      'auth/token',
      data: {
        "user": user,
        "password": password,
        "channel": channel,
        "aditionalItems": [
          {"Key": "IP", "Value": "192.168.162.12"},
          {"Key": "SmartphoneIMEI", "Value": "bd818720bb7f1ec1"},
        ],
      },
      operationName: 'Login',
    );
    return SignInResponseModel.fromJson(response.data);
  }
}
