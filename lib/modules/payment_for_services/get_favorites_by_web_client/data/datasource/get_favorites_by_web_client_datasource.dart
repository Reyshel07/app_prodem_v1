import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GetFavoritesByWebClientDatasource {
  final ApiClient _apiClient;
  GetFavoritesByWebClientDatasource(this._apiClient);

  Future<GetFavoritesByWebClientResponseEntity> getFavoritesByWebClient(
    String idWebClient,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getFavoritesByWebClient,
      operationName: 'service that collects preferred payments for services',
      data: {"IdWebClient": idWebClient},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetFavoritesByWebClientResponseModel.fromJson(response);
  }

  Future<UpdateDeleteFavoriteResponseEntity> updateDeleteFavorite(
    String idFavoritosServicios,
    String favoriteName,
    bool delete,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.updateDeleteFavorite,
      operationName: 'service that edits the name or deletes from favorites ',
      data: {
        "IdFavoritosServicios": idFavoritosServicios,
        "FavoriteName": favoriteName,
        "Delete": delete,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return UpdateDeleteFavoriteResponseModel.fromJson(response);
  }
}
