import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import '../../domain/repositories/repositori.dart';
import '../../domain/entities/entity.dart';
part 'session_info_event.dart';
part 'session_info_state.dart';

class SessionInfoBloc extends Bloc<SessionInfoEvent, SessionInfoState> {
  UserSessionInfoRepository userSessionInfoRepository;
  SessionInfoBloc(this.userSessionInfoRepository)
    : super(SessionInfoInitial()) {
    on<SessionInfEvent>(sessionInfo);
  }

  Future<void> sessionInfo(
    SessionInfEvent event,
    Emitter<SessionInfoState> emit,
  ) async {
    emit(SessionInfoLoading());
    try {
      String? token;
      try {
        token = SecureHive.readToken();
      } catch (_) {
        token = null;
      }

      final idWebClient = event.idWebClient ?? '1129150143954615';

      final response = await userSessionInfoRepository.userSession(
        idWebClient,
        token,
      );

      emit(SessionInfoSuccess('exitoso', response: response));
    } catch (e) {
      emit(SessionInfoError('error'));
    }
  }
}
