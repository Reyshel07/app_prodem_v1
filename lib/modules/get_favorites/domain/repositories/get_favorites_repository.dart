import '../entities/entity.dart';

abstract class GetFavoritesRepository {
  Future<GetFavoritesResponseEntity> getFavorites(
    String? vToken,
    String idUser,
    String accountType,
  );
}
