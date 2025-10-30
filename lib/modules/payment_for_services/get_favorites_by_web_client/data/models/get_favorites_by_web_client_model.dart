import 'dart:convert';
import '../../domain/entities/entity.dart';

GetFavoritesByWebClientResponseModel getFavoritesByWebClientResponseFromJson(
  String str,
) => GetFavoritesByWebClientResponseModel.fromJson(json.decode(str));

class GetFavoritesByWebClientResponseModel
    extends GetFavoritesByWebClientResponseEntity {
  GetFavoritesByWebClientResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetFavoritesByWebClientResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetFavoritesByWebClientResponseModel(
    data: List<GetFavoritesByWebClientModel>.from(
      json["data"].map((x) => GetFavoritesByWebClientModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class GetFavoritesByWebClientModel extends GetFavoritesByWebClientEntity {
  GetFavoritesByWebClientModel({
    required super.idFavoritosServicios,
    required super.idWebClient,
    required super.idExternalModule,
    required super.favoriteName,
    required super.searchData,
    required super.referenceData,
    required super.serviceName,
    required super.idGrupoFavorito,
    required super.externalModuleReference,
  });

  factory GetFavoritesByWebClientModel.fromJson(Map<String, dynamic> json) =>
      GetFavoritesByWebClientModel(
        idFavoritosServicios: json["idFavoritosServicios"],
        idWebClient: json["idWebClient"].toDouble(),
        idExternalModule: json["idExternalModule"],
        favoriteName: json["favoriteName"],
        searchData: json["searchData"],
        referenceData: json["referenceData"],
        serviceName: json["serviceName"],
        idGrupoFavorito: json["idGrupoFavorito"],
        externalModuleReference: json["externalModuleReference"],
      );
}

UpdateDeleteFavoriteResponseModel updateDeleteFavoriteResponseFromJson(
  String str,
) => UpdateDeleteFavoriteResponseModel.fromJson(json.decode(str));

class UpdateDeleteFavoriteResponseModel
    extends UpdateDeleteFavoriteResponseEntity {
  UpdateDeleteFavoriteResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory UpdateDeleteFavoriteResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => UpdateDeleteFavoriteResponseModel(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}
