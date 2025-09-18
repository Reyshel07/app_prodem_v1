part of 'session_info_bloc.dart';

sealed class SessionInfoEvent {}

class SessionInfEvent extends SessionInfoEvent {
  final String? idWebClient;
  SessionInfEvent({this.idWebClient});
}
