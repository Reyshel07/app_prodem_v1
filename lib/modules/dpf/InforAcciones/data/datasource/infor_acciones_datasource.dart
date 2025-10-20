import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/data/models/infor_acciones_model.dart';

import '../../domain/entities/entity.dart';

class InforAccionesDatasource {
  final ApiClient _apiClient;
  InforAccionesDatasource(this._apiClient);

  Future<InforAccionesResponseEntity> inforAccion(
    String idPersonWeb,
    String idcInfoType,
    String idDpfMfInitial,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.inforAcciones,
      operationName: 'bring the dpf information to renew',
      data: {
        "IdPersonWeb": idPersonWeb,
        "IdcInfoType": idcInfoType,
        "IdDpfMfInitial": idDpfMfInitial,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return InforAccionesResponse.fromJson(response);
  }
}
