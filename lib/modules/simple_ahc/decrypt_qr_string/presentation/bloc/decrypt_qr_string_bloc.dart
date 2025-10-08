import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/domain/entities/decrypt_qr_string_entity.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/domain/repositories/decrypt_qr_string_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'decrypt_qr_string_event.dart';
part 'decrypt_qr_string_state.dart';

class DecryptQrStringBloc
    extends Bloc<DecryptQrStringEvent, DecryptQrStringState> {
  DecryptQrStringRepository repository;
  DecryptQrStringBloc(this.repository) : super(DecryptQrStringInitial()) {
    on<DecryptQrStrEvent>(decryptQrStringBloc);
  }

  Future<void> decryptQrStringBloc(
    DecryptQrStrEvent event,
    Emitter<DecryptQrStringState> emit,
  ) async {
    emit(DecryptQrStringLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.decriptQRString(event.qrString, token);
      emit(DecryptQrStringSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(DecryptQrStringError(error.message));
        case "dio_unexpected":
          emit(DecryptQrStringError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
