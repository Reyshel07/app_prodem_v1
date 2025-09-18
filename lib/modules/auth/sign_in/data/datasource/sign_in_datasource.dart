import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';

class SignInDatasource {
  final _dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? ''));

  Future<SignInResponseEntity> signIn(
    String user,
    String password,
    int channel,
    List<AditionalItemEntity> aditionalItems,
  ) async {
    final response = await _dio.post(
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
    );
    return SignInResponseModel.fromJson(response.data);
  }
}
