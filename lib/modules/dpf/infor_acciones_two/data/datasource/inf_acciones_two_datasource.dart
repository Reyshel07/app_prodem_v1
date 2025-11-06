import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class InfAccionesTwoDatasource {
  final ApiClient _apiClient;
  InfAccionesTwoDatasource(this._apiClient);

  Future<InforAccionesResponseEntity> infAccion(
    String idPersonWeb,
    String idcInfoType,
    String idDpfMfInitial,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.inforAcciones,
      operationName: 'second inforAcciones service ',
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
    return InforAccionesResponseModel.fromJson(response);
  }
}
