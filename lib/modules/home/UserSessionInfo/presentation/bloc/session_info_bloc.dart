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
      final idWebClient = SecureHive.readIdWebPerson(); //'1129150143954615';
      final response = await repository.userSession(idWebClient, token);
      final idPerson = response.data.idPerson;
      final identityCardNumber = response.data.identityCardNumber;
      final isPersonNatural = response.data.isPersonNatural;
      final cellPhoneNumber = response.data.cellPhoneNumber;
      final personName = response.data.personName;
      final isEmployee = response.data.isEmployee;

      ///String
      if (idPerson.isNotEmpty) {
        await SecureHive.writeIdPerson(idPerson);
      }

      if (identityCardNumber.isNotEmpty) {
        await SecureHive.writeIdentityCardNumber(identityCardNumber);
      }

      if (cellPhoneNumber.isNotEmpty) {
        await SecureHive.writeCellPhoneNumber(cellPhoneNumber);
      }
      if (personName.isNotEmpty) {
        await SecureHive.writePersonName(personName);
      }

      ///bool
      await SecureHive.writeIsEmployee(isEmployee);
      await SecureHive.writeIsPersonNatural(isPersonNatural);

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
