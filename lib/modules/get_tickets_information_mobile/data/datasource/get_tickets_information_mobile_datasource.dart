import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GetTicketsInformationMobileDatasource {
  final ApiClient _apiClient;
  GetTicketsInformationMobileDatasource(this._apiClient);

  Future<GetTicketsInformationMobileResponseEntity>
  getTicketsInformationMobileResponseEntity(
    String codeAccount,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getTicketsInformationMobile,
      operationName: 'ticket delivery service',
      data: {"CodeAccount": codeAccount},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetTicketsInformationMobileResponseModel.fromJson(response);
  }
}
