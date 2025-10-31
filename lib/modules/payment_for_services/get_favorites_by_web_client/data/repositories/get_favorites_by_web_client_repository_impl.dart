import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GetFavoritesByWebClientRepositoryImpl
    extends GetFavoritesByWebClientRepository {
  GetFavoritesByWebClientDatasource datasource;
  GetFavoritesByWebClientRepositoryImpl({required this.datasource});

  @override
  Future<GetFavoritesByWebClientResponseEntity> getFavoritesByWebClient(
    String idWebClient,
    String? vToken,
  ) async {
    return await datasource.getFavoritesByWebClient(idWebClient, vToken);
  }

  @override
  Future<UpdateDeleteFavoriteResponseEntity> updateDeleteFavorite(
    String idFavoritosServicios,
    String favoriteName,
    bool delete,
    String? vToken,
  ) async {
    return await datasource.updateDeleteFavorite(
      idFavoritosServicios,
      favoriteName,
      delete,
      vToken,
    );
  }
}
