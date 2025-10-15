import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/data/models/get_account_numberln_other_bank_model.dart';

import '../../domain/entities/entity.dart';

class GetAccountNumberlnOtherBankDatasource {
  final ApiClient _apiClient;
  GetAccountNumberlnOtherBankDatasource(this._apiClient);

  Future<GetAccountNumberInOtherBankResponseEntity> accountNumberLnUtherBank(
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetAccountNumberInOtherBank',
      operationName:
          'service provided by Unión Bank for deposits from other institutions',
      data: {},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetAccountNumberInOtherBankResponseModel.fromJson(response);
  }
}
