import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/Deposits%20from%20other%20entities/get_account_numberIn_other_bank/data/models/get_account_numberln_other_bank_model.dart';

import '../../domain/entities/entity.dart';

class GetAccountNumberlnOtherBankDatasource {
  final ApiClient _apiClient;
  GetAccountNumberlnOtherBankDatasource(this._apiClient);

  Future<GetAccountNumberInOtherBankResponseEntity> accountNumberLnUtherBank(
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getAccountNumberInOtherBank,
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

  Future<GetFavoritesOtherDepositsResponseEntity> getFavoritesOtherDeposits(
    String? vToken,
    String idUser,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getFavoritesOtherDeposits,
      operationName: 'deposit from other entities - get favorites',
      data: {"IdUser": idUser},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetFavoritesOtherDepositsResponseModel.fromJson(response);
  }
}
