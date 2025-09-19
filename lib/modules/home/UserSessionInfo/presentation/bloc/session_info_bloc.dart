import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import '../../domain/repositories/repositori.dart';
import '../../domain/entities/entity.dart';

part 'session_info_event.dart';
part 'session_info_state.dart';

class SessionInfoBloc extends Bloc<SessionInfoEvent, SessionInfoState> {
  final UserSessionInfoRepository repository;

  SessionInfoBloc(this.repository) : super(SessionInfoState.initialState()) {
    on<SessionInfEvent>(_onLoadSessionInfo);
  }

  Future<void> _onLoadSessionInfo(
    SessionInfEvent event,
    Emitter<SessionInfoState> emit,
  ) async {
    emit(state.copyWith(status: SessionInfoStatus.loading));

    try {
      final token = SecureHive.readToken();
      final idWebClient = event.idWebClient ?? '1129150143954615';
      final response = await repository.userSession(idWebClient, token);

      emit(
        state.copyWith(
          userSessionInfo: response.data,
          status: SessionInfoStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SessionInfoStatus.error));
    }
  }
}
