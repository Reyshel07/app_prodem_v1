import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class InitialChargeBankGuaranteDatasource {
  final ApiClient _apiClient;
  InitialChargeBankGuaranteDatasource(this._apiClient);

  Future<InitialChargeBankGuaranteeResponseEntity> initialChargeBankGuarantee(
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.initialChargeBankGuarantee,
      operationName: 'service that runs at startup for bank bonds',
      data: {},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return InitialChargeBankGuaranteeResponseModel.fromJson(response);
  }
}
