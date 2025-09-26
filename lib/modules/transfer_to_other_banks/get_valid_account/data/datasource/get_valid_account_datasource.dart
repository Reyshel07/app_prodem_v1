import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/data/models/get_valid_account_model.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/domain/entities/get_valid_account_entity.dart';

class GetValidAccountDatasource {
  final ApiClient _apiClient;
  GetValidAccountDatasource(this._apiClient);

  Future<GetValidAccountResponseEntity> getValidAccount(
    String idbank,
    String accountNumber,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetValidAccount',
      operationName:
          'method that validates whether the bank account is correct ',
      data: {"Idbank": idbank, "AccountNumber": accountNumber},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetValidAccountResponseModel.fromJson(response);
  }
}
