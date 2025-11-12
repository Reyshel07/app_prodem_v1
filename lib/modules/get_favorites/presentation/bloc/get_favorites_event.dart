part of 'get_favorites_bloc.dart';

sealed class GetFavoritesEvent {}

class GetFavEvent extends GetFavoritesEvent {
  final String accountType;

  GetFavEvent({required this.accountType});
}
