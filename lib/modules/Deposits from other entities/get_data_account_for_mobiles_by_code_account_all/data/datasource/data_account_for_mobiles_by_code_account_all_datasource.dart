import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class DataAccountForMobilesByCodeAccountAllDatasource {
  final ApiClient _apiClient;
  DataAccountForMobilesByCodeAccountAllDatasource(this._apiClient);
  Future<GetDataAccountForMobilesByCodeAccountAllResponseEntity>
  dataAccountForMobileByCodeAccountAll(String codeAccount, vToken) async {
    final response = await _apiClient.post(
      AppStrings.getDataAccountForMobilesByCodeAccountAll,
      operationName: 'validates the PR account in deposits from other banks ',
      data: {"codeAccount": codeAccount},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetDataAccountForMobilesByCodeAccountAllResponseModel.fromJson(
      response,
    );
  }
}
