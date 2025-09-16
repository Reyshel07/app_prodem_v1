import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class AccountBalancesDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  //dotenv.env['url'] ?? ''; //
  Future<GetAccountBalancesResponseEntity> accountBalances(
    String codeSavingsAccount,
  ) async {
    final response = await _dio.post(
      '$baseUrl/Mobile/GetAccountBalances',
      data: {
        "CodeSavingsAccount": codeSavingsAccount,
        "IdPerson": "17000000000003984",
        "IdUser": "350880",
        "IMEI": "c0556d3b362470ac",
        "location": "",
        "IpAddress": "192.168.162.12",
      },
    );
    return GetAccountBalancesResponseModel.fromJson(response.data);
  }
}
