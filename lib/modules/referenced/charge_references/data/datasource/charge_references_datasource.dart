import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class ChargeReferencesDatasource {
  final ApiClient _apiClient;
  ChargeReferencesDatasource(this._apiClient);

  Future<ChargeReferencesResponseEntity> chargeReferences(
    String idWebPersonClient,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.chargeReferences,
      operationName: 'employee referral program for referring friends ',
      data: {"IdWebPersonClient": idWebPersonClient},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return ChargeReferencesResponseModel.fromJson(response);
  }
}
