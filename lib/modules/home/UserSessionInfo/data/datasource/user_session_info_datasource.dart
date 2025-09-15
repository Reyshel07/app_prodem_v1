import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class UserSessionInfoDataSouce {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';

  Future<UserSessionInfoResponseEntity> userSession() async {
    final response = await _dio.post(
      '$baseUrl/Mobile/UserSessionInfo',
      data: {"IdWebClient": "1129150143954615", "deviceIdentifier": ""},
      options: Options(
        headers: {
          'Authorization': 'Bearer  ',
          'Content-Type': 'application/json',
        },
      ),
    );
    return UserSessionInfoResponseModel.fromJson(response.data);
  }
}
