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
    List aditionalItems,
  ) async {
    final response = await _dio.post(
      '$baseUrl/api/auth/signin',
      data: {
        "username": username,
        "password": password,
        "chanel": chanel,
        "aditionalItems": aditionalItems,
      },
    );
    return SignInResponseModel.fromJson(response.data);
  }
}
