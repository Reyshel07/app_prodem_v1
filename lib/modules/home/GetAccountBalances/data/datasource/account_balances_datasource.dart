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
    String location,
    String ip, String imei
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetAccountBalances',
      data: {
        "CodeSavingsAccount": codeSavingsAccount,
        "IdPerson": idPErson,
        "IdUser": idUsert,
        "IMEI": imei,
        "location": location,
        "IpAddress": ip,
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
