import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'get_external_payment_generate_file_web_client_event.dart';
part 'get_external_payment_generate_file_web_client_state.dart';

class GetExternalPaymentGenerateFileWebClientBloc
    extends
        Bloc<
          GetExternalPaymentGenerateFileWebClientEvent,
          GetExternalPaymentGenerateFileWebClientState
        > {
  GetExternalPaymentGenerateFileWebClientRepository repository;
  GetExternalPaymentGenerateFileWebClientBloc(this.repository)
    : super(GetExternalPaymentGenerateFileWebClientInitial()) {
    on<GetExternalPaymentGenerateFileWebCliEvent>(
      getExternalPaymentGenerateFileWebClientBloc,
    );
  }

  Future<void> getExternalPaymentGenerateFileWebClientBloc(
    GetExternalPaymentGenerateFileWebCliEvent event,
    Emitter<GetExternalPaymentGenerateFileWebClientState> emit,
  ) async {
    emit(GetExternalPaymentGenerateFileWebClientLoading());
    try {
      String sizePage = '10';
      final token = SecureHive.readToken();
      final idWebClient = SecureHive.readIdWebPerson();
      final response = await repository.externalPaymentGeneral(
        token,
        idWebClient,
        event.initPage,
        sizePage,
      );
      emit(GetExternalPaymentGenerateFileWebClientSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetExternalPaymentGenerateFileWebClientError(error.message));
        case "dio_unexpected":
          emit(
            GetExternalPaymentGenerateFileWebClientError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
