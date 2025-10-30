part of 'update_delete_favorite_bloc.dart';

sealed class UpdateDeleteFavoriteEvent {}

class UpdateDeleteFavoEvent extends UpdateDeleteFavoriteEvent {
  final String idFavoritosServicios;
  final String favoriteName;
  final bool delete;
  UpdateDeleteFavoEvent({
    required this.delete,
    required this.favoriteName,
    required this.idFavoritosServicios,
  });
}
