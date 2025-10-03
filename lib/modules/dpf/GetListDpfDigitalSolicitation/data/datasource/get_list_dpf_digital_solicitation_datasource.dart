import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/data/models/get_list_dpf_digital_solicitation_model.dart';

import '../../domain/entities/entity.dart';

class GetListDpfDigitalSolicitationDatasource {
  final ApiClient _apiClient;
  GetListDpfDigitalSolicitationDatasource(this._apiClient);

  Future<GetListDpfDigitalSolicitationResponseEntity> getListDpfDigiSoli(
    String idGeographicLocation,
    String idWebPerson,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetListDpfDigitalSolicitation',
      operationName: 'get the list of dpf',
      data: {
        "IdGeographicLocation": idGeographicLocation,
        "IdWebPerson": idWebPerson,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetListDpfDigitalSolicitationResponse.fromJson(response);
  }
}
