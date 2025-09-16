import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositori.dart';
part 'session_info_event.dart';
part 'session_info_state.dart';

class SessionInfoBloc extends Bloc<SessionInfoEvent, SessionInfoState> {
  UserSessionInfoRepository userSessionInfoRepository;
  SessionInfoBloc(this.userSessionInfoRepository)
    : super(SessionInfoInitial()) {
    on<SessionInfoEvent>(sessionInfo);
  }

  Future<void> sessionInfo(
    SessionInfoEvent event,
    Emitter<SessionInfoState> emit,
  ) async {
    emit(SessionInfoLoading());
    try {
      await userSessionInfoRepository.userSession();
      emit(SessionInfoSuccess('exitoso'));
    } catch (e) {
      emit(SessionInfoError('error'));
    }
  }
}
