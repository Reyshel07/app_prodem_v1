import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class VerificaPlazoRenovacionDatasource {
  final ApiClient _apiClient;
  VerificaPlazoRenovacionDatasource(this._apiClient);

  Future<VerificaPlazoRenovacionResponseEntity> verificaPlazoRenovacion(
    String idDpfOffice,
    String termInDays,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.verificaPlazoRenovacion,
      operationName:
          'service that validates the date for cancellation and renewal',
      data: {"IdDpfOffice": idDpfOffice, "TermInDays": termInDays},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return VerificaPlazoRenovacionResponseModel.fromJson(response);
  }
}
