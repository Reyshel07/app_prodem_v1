import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GetExternalPaymentGenerateFileWebClientDatasource {
  final ApiClient _apiClient;
  GetExternalPaymentGenerateFileWebClientDatasource(this._apiClient);

  Future<GetExternalPaymentGenerateFileByWebClientResponseEntity>
  externalPaymentGenerate(
    String? vToken,
    String idWebClient,
    String initPage,
    String sizePage,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getExternalPaymentGenerateFileByWebClient,
      operationName: 'service that brings all savings account transactions',
      data: {
        "IdWebClient": idWebClient,
        "InitPage": initPage,
        "SizePage": sizePage,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetExternalPaymentGenerateFileByWebClientResponseModel.fromJson(
      response,
    );
  }
}
