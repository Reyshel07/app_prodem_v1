import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/web_person_device_authenticate_pr_key_repository.dart';
part 'web_person_device_authenticate_pr_key_event.dart';
part 'web_person_device_authenticate_pr_key_state.dart';

class WebPersonDeviceAuthenticatePrKeyBloc
    extends
        Bloc<
          WebPersonDeviceAuthenticatePrKeyEvent,
          WebPersonDeviceAuthenticatePrKeyState
        > {
  WebPersonDeviceAuthenticatePrKeyRepository repository;
  WebPersonDeviceAuthenticatePrKeyBloc(this.repository)
    : super(WebPersonDeviceAuthenticatePrKeyInitial()) {
    on<WebPersonDeviceAuthenPrKeyEvent>(webPersonDeviceAuthenticatePrKeyBloc);
  }
  Future<void> webPersonDeviceAuthenticatePrKeyBloc(
    WebPersonDeviceAuthenPrKeyEvent event,
    Emitter<WebPersonDeviceAuthenticatePrKeyState> emit,
  ) async {
    emit(WebPersonDeviceAuthenticatePrKeyLoading());
    try {
      String deviceIMEI = '45165sdwe45we46-PC';
      String userName = 'quique';
      final token = SecureHive.readToken();
      final response = await repository.webPersonDeviceAuthenticateProdemKey(
        deviceIMEI,
        userName,
        event.customerPIN,
        event.verifyPIN,
        token,
      );
      emit(WebPersonDeviceAuthenticatePrKeySuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(WebPersonDeviceAuthenticatePrKeyError(error.message));
        case "dio_unexpected":
          emit(
            WebPersonDeviceAuthenticatePrKeyError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
