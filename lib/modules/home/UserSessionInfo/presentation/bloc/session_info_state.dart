part of 'session_info_bloc.dart';

sealed class SessionInfoState {}

final class SessionInfoInitial extends SessionInfoState {}

final class SessionInfoLoading extends SessionInfoState {}

final class SessionInfoError extends SessionInfoState {
  final String message;
  SessionInfoError(this.message);
}

final class SessionInfoSuccess extends SessionInfoState {
  UserInfoResponseEnttity userInfoResponseEnttity;
  SessionInfoSuccess(this.userInfoResponseEnttity);
}
