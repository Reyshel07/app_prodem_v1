import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class AccountBalancesDatasource {
  final ApiClient _apiClient;
  AccountBalancesDatasource(this._apiClient);

  Future<GetAccountBalancesResponseEntity> accountBalances(
    String codeSavingsAccount,
    String idPErson,
    String idUsert,
    String? vToken,
    String location
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetAccountBalances',
      data: {
        "CodeSavingsAccount": codeSavingsAccount,
        "IdPerson": idPErson,
        "IdUser": idUsert,
        "IMEI": "c0556d3b362470ac",
        "location": location,
        "IpAddress": "192.168.162.12",
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'final balance inquiry',
    );
    return GetAccountBalancesResponseModel.fromJson(response);
  }
}
