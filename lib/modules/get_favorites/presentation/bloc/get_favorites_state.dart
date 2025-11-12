part of 'get_favorites_bloc.dart';

sealed class GetFavoritesState {}

final class GetFavoritesInitial extends GetFavoritesState {}

final class GetFavoritesLoading extends GetFavoritesState {}

final class GetFavoritesError extends GetFavoritesState {
  final String message;
  GetFavoritesError(this.message);
}

final class GetFavoritesSuccess extends GetFavoritesState {
  GetFavoritesResponseEntity getFavoritesResponseEntity;
  GetFavoritesSuccess(this.getFavoritesResponseEntity);
}
