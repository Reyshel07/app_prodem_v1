import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class UserSessionInfoDataSouce {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';

  Future<UserSessionInfoResponseEntity> userSession(
    String? vIdWebClient,
    String? vToken,
  ) async {
    final response = await _dio.post(
      '$baseUrl/Mobile/UserSessionInfo',
      data: {
        "IdWebClient": vIdWebClient, // "1129150143954615",
        "deviceIdentifier": "",
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $vToken',
          'Content-Type': 'application/json',
        },
      ),
    );
    return UserSessionInfoResponseModel.fromJson(response.data);
  }
}
