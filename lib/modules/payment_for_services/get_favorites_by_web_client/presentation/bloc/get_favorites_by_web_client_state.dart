part of 'get_favorites_by_web_client_bloc.dart';

sealed class GetFavoritesByWebClientState {}

final class GetFavoritesByWebClientInitial
    extends GetFavoritesByWebClientState {}

final class GetFavoritesByWebClientLoading
    extends GetFavoritesByWebClientState {}

final class GetFavoritesByWebClientError extends GetFavoritesByWebClientState {
  final String message;
  GetFavoritesByWebClientError(this.message);
}

final class GetFavoritesByWebClientSuccess
    extends GetFavoritesByWebClientState {
  GetFavoritesByWebClientResponseEntity getFavoritesByWebClientResponseEntity;
  GetFavoritesByWebClientSuccess(this.getFavoritesByWebClientResponseEntity);
}
