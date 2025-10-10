import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/domain/repositories/get_current_qr_by_type_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'get_current_qr_by_type_event.dart';
part 'get_current_qr_by_type_state.dart';

class GetCurrentQrByTypeBloc
    extends Bloc<GetCurrentQrByTypeEvent, GetCurrentQrByTypeState> {
  GetCurrentQrByTypeRepository repository;
  GetCurrentQrByTypeBloc(this.repository) : super(GetCurrentQrByTypeInitial()) {
    on<GetCurrentQrEvent>(getCurrentQRByTypeBloc);
  }

  Future<void> getCurrentQRByTypeBloc(
    GetCurrentQrEvent event,
    Emitter<GetCurrentQrByTypeState> emit,
  ) async {
    emit(GetCurrentQrByTypeLoading());
    try {
      final token = SecureHive.readToken();

      final response = await repository.currentQrByType(token);
      emit(GetCurrentQrByTypeSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetCurrentQrByTypeError(error.message));
        case "dio_unexpected":
          emit(GetCurrentQrByTypeError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
