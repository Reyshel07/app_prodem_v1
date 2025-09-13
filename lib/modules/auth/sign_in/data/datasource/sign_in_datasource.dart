import 'package:app_prodem_v1/modules/auth/sign_in/data/models/sign_in_response_model.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/entities.dart';

class SignInDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  //dotenv.env['url'] ?? '';

  Future<SignInResponseEntity> signIn(
    String username,
    String password,
    int chanel,
    List<AditionalItemEntity> aditionalItems,
  ) async {
    final response = await _dio.post(
      '$baseUrl/auth/token',
      data: {
        "username": username,
        "password": password,
        "chanel": chanel,
        "aditionalItems": [
          {"Key": "IP", "Value": "192.168.162.12"},
          {"Key": "SmartphoneIMEI", "Value": "45165sdwe45we46"},
        ],
      },
    );
    print(response.data);
    return SignInResponseModel.fromJson(response.data);
  }
}
