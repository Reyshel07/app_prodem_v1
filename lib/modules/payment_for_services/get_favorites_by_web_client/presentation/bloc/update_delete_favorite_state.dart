part of 'update_delete_favorite_bloc.dart';

sealed class UpdateDeleteFavoriteState {}

final class UpdateDeleteFavoriteInitial extends UpdateDeleteFavoriteState {}

final class UpdateDeleteFavoriteLoading extends UpdateDeleteFavoriteState {}

final class UpdateDeleteFavoritetError extends UpdateDeleteFavoriteState {
  final String message;
  UpdateDeleteFavoritetError(this.message);
}

final class UpdateDeleteFavoriteSuccess extends UpdateDeleteFavoriteState {
  UpdateDeleteFavoriteResponseEntity updateDeleteFavoriteResponseEntity;
  UpdateDeleteFavoriteSuccess(this.updateDeleteFavoriteResponseEntity);
}
