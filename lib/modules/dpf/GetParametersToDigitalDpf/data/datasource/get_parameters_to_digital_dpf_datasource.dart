import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/GetParametersToDigitalDpf/data/models/get_parameters_to_digital_dpf_model.dart';

import '../../domain/entities/entity.dart';

class GetParametersToDigitalDpfDatasource {
  final ApiClient _apiClient;
  GetParametersToDigitalDpfDatasource(this._apiClient);

  Future<GetParametersToDigitalDpfResponseentity> getParametersToDigitalDpf(
    String idFather,
    bool isEmployee,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getParametersToDigitalDpf,
      operationName: 'DPF request',
      data: {"idFather": idFather, "isEmployee": isEmployee},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetParametersToDigitalDpfResponseModel.fromJson(response);
  }

  Future<GetOfficeListByIdGeographicLocationEntity> getOfficeListByIdGeo(
    String operationName,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getOfficeListByIdGeographicLocation,
      operationName:
          'obtains the DPF incorporation agencies from the departments',
      data: {"IdGeographicLocation": operationName},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetOfficeListByIdGeographicLocationModel.fromJson(response);
  }

  Future<GetDateEstimateResponseEntity> getDateEst(
    String term,
    String idOffice,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getDateEstimate,
      operationName: 'shows the estimated time from start to finish',
      data: {"term": term, "idOffice": idOffice},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetDateEstimateResponseModel.fromJson(response);
  }
}
