import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class ListGetOtherAccountDepositDatasource {
  final ApiClient _apiClient;
  ListGetOtherAccountDepositDatasource(this._apiClient);

  Future<ListGetOtherAccountDepositResponseEntity> listGetOtherAccountDeposit(
    String? vToken,
    String idPerson,
  ) async {
    final response = await _apiClient.post(
      'Mobile/ListGetOtherAccountDeposit',
      operationName: 'service that calls the list of requests in the tray ',
      data: {"IdPerson": idPerson},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return ListGetOtherAccountDepositResponseModel.fromJson(response);
  }
}
