import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GetWebBankGuaranteeSolicitationDataDatasource {
  final ApiClient _apiClient;
  GetWebBankGuaranteeSolicitationDataDatasource(this._apiClient);

  Future<GetWebBankGuaranteeSolicitationDataResponseEntity>
  getWebBankGuaranteeSolicitationData(
    String idWebPersonClient,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getWebBankGuaranteeSolicitationData,
      operationName: 'operationName',
      data: {"IdWebPersonClient": idWebPersonClient},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetWebBankGuaranteeSolicitationDataResponseModel.fromJson(response);
  }
}
