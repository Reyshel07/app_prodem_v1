import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GetPafDataForMobileAppDatasource {
  final ApiClient _apiClient;
  GetPafDataForMobileAppDatasource(this._apiClient);

  Future<GetPafDataForMobileAppResponseEntity> getPafDataForMobileApp(
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getPafDataForMobileApp,
      operationName: 'Financial service points',
      data: {},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetPafDataForMobileAppResponseModel.fromJson(response);
  }
}
