import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/data/models/get_list_dpf_digital_solicitation_model.dart';

import '../../domain/entities/entity.dart';

class GetListDpfDigitalSolicitationDatasource {
  final ApiClient _apiClient;
  GetListDpfDigitalSolicitationDatasource(this._apiClient);

  Future<GetListDpfDigitalSolicitationResponseEntity> getListDpfDigiSoli(
    String idWebPerson,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getListDpfDigitalSolicitation,
      operationName: 'get the list of dpf',
      data: {"IdWebPerson": idWebPerson},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetListDpfDigitalSolicitationResponse.fromJson(response);
  }
}
