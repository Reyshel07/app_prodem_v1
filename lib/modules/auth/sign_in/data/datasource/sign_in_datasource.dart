import 'package:dio/dio.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

class SignInDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  //dotenv.env['url'] ?? ''; //

  Future<SignInResponseEntity> signIn(
    String user,
    String password,
    int channel,
    List<AditionalItemEntity> aditionalItems,
  ) async {
    final response = await _dio.post(
      '$baseUrl/auth/token',
      data: {
        "user": user,
        "password": password,
        "channel": channel,
        "aditionalItems": [
          {"Key": "IP", "Value": "192.168.162.12"},
          {"Key": "SmartphoneIMEI", "Value": "45165sdwe45we46"},
        ],
      },
    );
    return SignInResponseModel.fromJson(response.data);
  }
}
