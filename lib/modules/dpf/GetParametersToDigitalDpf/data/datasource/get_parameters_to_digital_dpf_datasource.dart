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
      'Mobile/GetParametersToDigitalDpf',
      operationName: 'DPF request',
      data: {"idFather": idFather, "isEmployee": isEmployee},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetParametersToDigitalDpfResponseModel.fromJson(response);
  }
}
