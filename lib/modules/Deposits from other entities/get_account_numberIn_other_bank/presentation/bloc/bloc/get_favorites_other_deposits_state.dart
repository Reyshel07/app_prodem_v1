part of 'get_favorites_other_deposits_bloc.dart';

sealed class GetFavoritesOtherDepositsState {}

final class GetFavoritesOtherDepositsInitial
    extends GetFavoritesOtherDepositsState {}

final class GetFavoritesOtherDepositsLoading
    extends GetFavoritesOtherDepositsState {}

final class GetFavoritesOtherDepositsError
    extends GetFavoritesOtherDepositsState {
  final String message;
  GetFavoritesOtherDepositsError(this.message);
}

final class GetFavoritesOtherDepositsSuccess
    extends GetFavoritesOtherDepositsState {
  GetFavoritesOtherDepositsResponseEntity
  getFavoritesOtherDepositsResponseEntity;
  GetFavoritesOtherDepositsSuccess(
    this.getFavoritesOtherDepositsResponseEntity,
  );
}
