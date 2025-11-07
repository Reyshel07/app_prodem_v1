import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'verifica_plazo_renovacion_event.dart';
part 'verifica_plazo_renovacion_state.dart';

class VerificaPlazoRenovacionBloc
    extends Bloc<VerificaPlazoRenovacionEvent, VerificaPlazoRenovacionState> {
  VerificaPlazoRenovacionRepository repository;
  VerificaPlazoRenovacionBloc(this.repository)
    : super(VerificaPlazoRenovacionInitial()) {
    on<VerificaPlazoRenoEvent>(verificaPlazoRenovacionBloc);
  }

  Future<void> verificaPlazoRenovacionBloc(
    VerificaPlazoRenoEvent event,
    Emitter<VerificaPlazoRenovacionState> emit,
  ) async {
    emit(VerificaPlazoRenovacionLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.verificaPlazoRenovacion(
        event.idDpfOffice,
        event.termInDays,
        token,
      );
      emit(VerificaPlazoRenovacionSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(VerificaPlazoRenovacionError(error.message));
        case "dio_unexpected":
          emit(
            VerificaPlazoRenovacionError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
