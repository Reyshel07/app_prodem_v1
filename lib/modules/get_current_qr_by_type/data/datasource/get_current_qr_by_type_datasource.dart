import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/data/models/get_current_qr_by_type_model.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/domain/entities/entity.dart';

class GetCurrentQrByTypeDatasource {
  final ApiClient _apiClient;
  GetCurrentQrByTypeDatasource(this._apiClient);

  Future<GetCurrentQrByTypeResponseEntity> currentQrByType(
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetCurrentQrByType',
      operationName: 'deposit from other entities',
      data: {},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetCurrentQrByTypeResponseModel.fromJson(response);
  }
}
