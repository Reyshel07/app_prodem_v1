import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class InsuranceGetListDatasource {
  final ApiClient _apiClient;
  InsuranceGetListDatasource(this._apiClient);

  Future<InsuranceGetListResponseEntity> insuranceGetList(
    String identityCardNumber,
    String idPerson,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.insuranceGetList,
      operationName: 'service that provides the list of insurance payments',
      data: {"IdentityCardNumber": identityCardNumber, "IdPerson": idPerson},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return InsuranceGetListResponseModel.fromJson(response);
  }
}
