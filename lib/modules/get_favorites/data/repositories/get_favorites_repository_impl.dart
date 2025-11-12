import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GetFavoritesRepositoryImpl extends GetFavoritesRepository {
  GetFavoritesDatasource datasource;
  GetFavoritesRepositoryImpl({required this.datasource});

  @override
  Future<GetFavoritesResponseEntity> getFavorites(
    String? vToken,
    String idUser,
    String accountType,
  ) async {
    return await datasource.getFavorites(vToken, idUser, accountType);
  }
}
