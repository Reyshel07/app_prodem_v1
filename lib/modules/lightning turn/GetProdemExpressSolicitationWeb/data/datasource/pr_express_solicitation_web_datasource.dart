import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/lightning%20turn/GetProdemExpressSolicitationWeb/data/models/pr_express_solicitation_web_model.dart';

import '../../domain/entities/entity.dart';

class PrExpressSolicitationWebDatasource {
  final ApiClient _apiClient;
  PrExpressSolicitationWebDatasource(this._apiClient);
  Future<GetProdemExpressSolicitationWebResponseEntity> prExpressSoliWeb(
    String idPerson,
    String? vToken,
    List<String> colCodeSavingsAccounts,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetProdemExpressSolicitationWeb',
      operationName: 'obtain list of lightning transfers',
      data: {
        "ColCodeSavingsAccount": colCodeSavingsAccounts,
        "IdPerson": idPerson,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetProdemExpressSolicitationWebResponseModel.fromJson(response);
  }
}
