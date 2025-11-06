import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/dpf/InforAcciones/domain/repositories/infor_acciones_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_ownership_edv_event.dart';
part 'check_ownership_edv_state.dart';

class CheckOwnershipEdvBloc
    extends Bloc<CheckOwnershipEdvEvent, CheckOwnershipEdvState> {
  InforAccionesRepository repository;
  CheckOwnershipEdvBloc(this.repository) : super(CheckOwnershipEdvInitial()) {
    on<CheckOwnershipEdvEv>(checkOwnershipEdvBloc);
  }

  Future<void> checkOwnershipEdvBloc(
    CheckOwnershipEdvEv event,
    Emitter<CheckOwnershipEdvState> emit,
  ) async {
    emit(CheckOwnershipEdvIniLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.checkOwnershipEdv(
        event.idFixedAcount,
        token,
      );
      emit(CheckOwnershipEdvSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(CheckOwnershipEdvIninrror(error.message));
        case "dio_unexpected":
          emit(
            CheckOwnershipEdvIninrror("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
