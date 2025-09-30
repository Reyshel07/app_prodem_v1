import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import '../../domain/repositories/repositori.dart';
import '../../domain/entities/entity.dart';

part 'session_info_event.dart';
part 'session_info_state.dart';

class SessionInfoBloc extends Bloc<SessionInfoEvent, SessionInfoState> {
  final UserSessionInfoRepository repository;

  SessionInfoBloc(this.repository) : super(SessionInfoInitial()) {
    on<SessionInfEvent>(_onLoadSessionInfo);
  }

  Future<void> _onLoadSessionInfo(
    SessionInfEvent event,
    Emitter<SessionInfoState> emit,
  ) async {
    emit(SessionInfoLoading());

    try {
      final token = SecureHive.readToken();
      final idWebClient = event.idWebClient ?? SecureHive.readIdWebPerson(); //'1129150143954615';
      final response = await repository.userSession(idWebClient, token);
       final idPerson = response.data.idPerson;
      if(idPerson.isNotEmpty){
        await SecureHive.writeIdPerson(idPerson);
      }

      emit(SessionInfoSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(SessionInfoError(error.message));
        case "dio_unexpected":
          emit(SessionInfoError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
