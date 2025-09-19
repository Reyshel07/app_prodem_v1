part of 'session_info_bloc.dart';

enum SessionInfoStatus { initial, loading, success, error }

class SessionInfoState {
  final UserInfoResponseEnttity? userSessionInfo;
  final SessionInfoStatus status;

  const SessionInfoState({
    this.userSessionInfo,
    this.status = SessionInfoStatus.initial,
  });

  factory SessionInfoState.initialState() => const SessionInfoState();

  SessionInfoState copyWith({
    UserInfoResponseEnttity? userSessionInfo,
    SessionInfoStatus? status,
  }) {
    return SessionInfoState(
      userSessionInfo: userSessionInfo ?? this.userSessionInfo,
      status: status ?? this.status,
    );
  }
}

extension SessionInfoStateX on SessionInfoState {
  bool get isLoading => status == SessionInfoStatus.loading;
  bool get isSuccess => status == SessionInfoStatus.success;
  bool get isError => status == SessionInfoStatus.error;
  bool get hasData => userSessionInfo != null;
}
