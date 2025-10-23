import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class CreditCarDataForRecoveryDatasource {
  final ApiClient _apiClient;
  CreditCarDataForRecoveryDatasource(this._apiClient);

  Future<CreditCardDataForRecoveryResponseEntity> creditCardDataForRecovery(
    String idCreditLineInstance,
    String creditCardNumber,
    String codeSavingAccountSource,
    String amountOperation,
    int idMoneyOperation,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.creditCardDataForRecovery,
      operationName: 'service that processes credit card payments',
      data: {
        "idCreditLineInstance": idCreditLineInstance,
        "creditCardNumber": creditCardNumber,
        "CodeSavingAccountSource": codeSavingAccountSource,
        "AmountOperation": amountOperation,
        "IdMoneyOperation": idMoneyOperation,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return CreditCardDataForRecoveryResponseModel.fromJson(response);
  }
}
