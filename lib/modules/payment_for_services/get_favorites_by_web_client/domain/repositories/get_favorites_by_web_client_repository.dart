import '../entities/entity.dart';

abstract class GetFavoritesByWebClientRepository {
  Future<GetFavoritesByWebClientResponseEntity> getFavoritesByWebClient(
    String idWebClient,
    String? vToken,
  );
  Future<UpdateDeleteFavoriteResponseEntity> updateDeleteFavorite(
    String idFavoritosServicios,
    String favoriteName,
    bool delete,
    String? vToken,
  );
}
