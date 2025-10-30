class GetFavoritesByWebClientResponseEntity {
  final List<GetFavoritesByWebClientEntity> data;
  final int state;
  final String message;

  GetFavoritesByWebClientResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetFavoritesByWebClientEntity {
  final int idFavoritosServicios;
  final double idWebClient;
  final int idExternalModule;
  final String favoriteName;
  final String searchData;
  final String referenceData;
  final dynamic serviceName;
  final int idGrupoFavorito;
  final dynamic externalModuleReference;

  GetFavoritesByWebClientEntity({
    required this.idFavoritosServicios,
    required this.idWebClient,
    required this.idExternalModule,
    required this.favoriteName,
    required this.searchData,
    required this.referenceData,
    required this.serviceName,
    required this.idGrupoFavorito,
    required this.externalModuleReference,
  });
}

//updateFavorites

class UpdateDeleteFavoriteResponseEntity {
  final bool data;
  final int state;
  final String message;

  UpdateDeleteFavoriteResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}
