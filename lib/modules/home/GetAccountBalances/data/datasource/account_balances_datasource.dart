import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class AccountBalancesDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  //dotenv.env['url'] ?? ''; //
  Future<GetAccountBalancesResponseEntity> accountBalances(
    String codeSavingsAccount,
    String idPErson,
    String idUsert,
    String? vToken,
  ) async {
    final response = await _dio.post(
      '$baseUrl/Mobile/GetAccountBalances',
      data: {
        "CodeSavingsAccount": codeSavingsAccount,
        "IdPerson": idPErson,
        "IdUser": idUsert,
        "IMEI": "c0556d3b362470ac",
        "location": "",
        "IpAddress": "192.168.162.12",
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $vToken',
          'Content-Type': 'application/json',
        },
      ),
    );
    return GetAccountBalancesResponseModel.fromJson(response.data);
  }
}
