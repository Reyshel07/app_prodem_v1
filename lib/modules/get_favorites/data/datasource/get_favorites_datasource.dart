import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GetFavoritesDatasource {
  final ApiClient _apiClient;
  GetFavoritesDatasource(this._apiClient);
  Future<GetFavoritesResponseEntity> getFavorites(
    String? vToken,
    String idUser,
    String accountType,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getFavorites,
      operationName: 'service that retrieves favorite accounts',
      data: {"idUser": idUser, "accountType": accountType},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetFavoritesResponseModel.fromJson(response);
  }
}
