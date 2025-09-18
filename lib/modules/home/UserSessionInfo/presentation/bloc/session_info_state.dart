part of 'session_info_bloc.dart';

sealed class SessionInfoState {}

final class SessionInfoInitial extends SessionInfoState {}

final class SessionInfoLoading extends SessionInfoState {}

final class SessionInfoError extends SessionInfoState {
  final String message;
  SessionInfoError(this.message);
}

final class SessionInfoSuccess extends SessionInfoState {
  final String mesage;
  final String? token;
  final UserSessionInfoResponseEntity? response;
  SessionInfoSuccess(this.mesage, {this.token, this.response});
}
