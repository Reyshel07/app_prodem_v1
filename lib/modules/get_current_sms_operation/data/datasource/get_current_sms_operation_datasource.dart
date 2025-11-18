import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GetCurrentSmsOperationDatasource {
  final ApiClient _apiClient;
  GetCurrentSmsOperationDatasource(this._apiClient);

  Future<GetCurrentSmsOperationResponseEntity> getCurrentSmsOperation(
    String? vToken,
    String idWebUser,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getCurrentSmsOperation,
      operationName: 'service that executes the pr key for other apps',
      data: {"IdWebUser": idWebUser},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetCurrentSmsOperationResponseModel.fromJson(response);
  }
}
