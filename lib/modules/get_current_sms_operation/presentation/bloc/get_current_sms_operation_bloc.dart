import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'get_current_sms_operation_event.dart';
part 'get_current_sms_operation_state.dart';

class GetCurrentSmsOperationBloc
    extends Bloc<GetCurrentSmsOperationEvent, GetCurrentSmsOperationState> {
  GetCurrentSmsOperationRepository repository;
  GetCurrentSmsOperationBloc(this.repository)
    : super(GetCurrentSmsOperationInitial()) {
    on<GetCurrentSmsOperaEvent>(getCurrentSmsOperationBloc);
  }

  Future<void> getCurrentSmsOperationBloc(
    GetCurrentSmsOperaEvent event,
    Emitter<GetCurrentSmsOperationState> emit,
  ) async {
    emit(GetCurrentSmsOperationLoading());
    try {
      String idUser1 = SecureHive.readIdUser();
      final token = SecureHive.readToken();
      final response = await repository.getCurrentSmsOperation(token, idUser1);
      emit(GetCurrentSmsOperationSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(GetCurrentSmsOperationError(error.message));
        case "dio_unexpected":
          emit(
            GetCurrentSmsOperationError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
