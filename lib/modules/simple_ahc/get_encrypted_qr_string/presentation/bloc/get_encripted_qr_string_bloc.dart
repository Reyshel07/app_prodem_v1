import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/domain/repositories/get_encrypted_qr_string_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'get_encripted_qr_string_event.dart';
part 'get_encripted_qr_string_state.dart';

class GetEncriptedQrStringBloc
    extends Bloc<GetEncriptedQrStringEvent, GetEncriptedQrStringState> {
  GetEncryptedQrStringRepository repository;
  GetEncriptedQrStringBloc(this.repository)
    : super(GetEncriptedQrStringInitial()) {
    on<GetEncriptedQrSEvent>(getEncriptedQrStringBloc);
  }
  Future<void> getEncriptedQrStringBloc(
    GetEncriptedQrSEvent event,
    Emitter<GetEncriptedQrStringState> emit,
  ) async {
    emit(GetEncriptedQrStringLoading());
    try {
      final idPerson = SecureHive.readIdPerson();
      final token = SecureHive.readToken();
      String idQuickResponse = '0';
      final response = await repository.getEncryptedQrString(
        token,
        idPerson,
        event.accountCode,
        event.moneyCode,
        event.amount,
        event.isUniqueUse,
        event.expiredOption,
        event.reference,
        idQuickResponse,
      );
      emit(GetEncriptedQrStringSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(GetEncriptedQrStringError(error.message));
        case "dio_unexpected":
          emit(
            GetEncriptedQrStringError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
