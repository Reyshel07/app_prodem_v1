import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entity.dart';
import '../../../domain/repositories/repositori.dart';
part 'get_desmaterialization_rerport_to_web_event.dart';
part 'get_desmaterialization_rerport_to_web_state.dart';

class GetDesmaterializationRerportToWebBloc
    extends
        Bloc<
          GetDesmaterializationRerportToWebEvent,
          GetDesmaterializationRerportToWebState
        > {
  UserSessionInfoRepository repository;
  GetDesmaterializationRerportToWebBloc(this.repository)
    : super(GetDesmaterializationRerportToWebInitial()) {
    on<GetDesmaterializationRerportToWebEvent>(
      getDesmaterializationRerportToWebBloc,
    );
  }
  //falta implementar
  Future<void> getDesmaterializationRerportToWebBloc(
    GetDesmaterializationRerportToWebEvent event,
    Emitter<GetDesmaterializationRerportToWebState> emit,
  ) async {
    if (event is GetDesmaRerToWebEvent) {
      emit(SessionInfoLoading());
      try {
        final token = SecureHive.readToken();

        final response = await repository.getDesmaterializationRerportToWeb(
          event.codeOperation,
          token,
        );
        emit(GetDesmaterializationRerportToWebSuccess(response));
      } on BaseApiException catch (error) {
        switch (error.key) {
          case "api_logic_error":
            emit(GetDesmaterializationRerportToWebError(error.message));
          case "dio_unexpected":
            emit(
              GetDesmaterializationRerportToWebError(
                "Ocurrio un error, no tiene internet",
              ),
            );
        }
      }
    }
  }
}
