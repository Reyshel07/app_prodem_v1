part of 'get_ach_banck_bloc.dart';

sealed class GetAchBanckState {}

final class GetAchBanckInitial extends GetAchBanckState {}

final class GetAchBanckLoading extends GetAchBanckState {}

final class GetAchBanckError extends GetAchBanckState {
  final String message;
  GetAchBanckError(this.message);
}

final class GetAchBanckSuccess extends GetAchBanckState {
  final GetAchBanksListResponseEntity getAchBanksListResponseEntity;
  GetAchBanckSuccess(this.getAchBanksListResponseEntity);
}
