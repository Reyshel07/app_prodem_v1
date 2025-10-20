import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/ATM/validate_qr_from_prodem_movil/domain/repositories/repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'validate_qr_from_prodem_movil_event.dart';
part 'validate_qr_from_prodem_movil_state.dart';

class ValidateQrFromProdemMovilBloc
    extends
        Bloc<ValidateQrFromProdemMovilEvent, ValidateQrFromProdemMovilState> {
  ValidateQrFromProdemMovilRepository repository;
  ValidateQrFromProdemMovilBloc(this.repository)
    : super(ValidateQrFromProdemMovilInitial()) {
    on<ValidateQrFromPRodemMEvent>(validateQrFromProdemMovilBloc);
  }
  Future<void> validateQrFromProdemMovilBloc(
    ValidateQrFromPRodemMEvent event,
    Emitter<ValidateQrFromProdemMovilState> emit,
  ) async {
    emit(ValidateQrFromProdemMovilLoading());
    try {
      final token = SecureHive.readToken();
      String idWebClient = SecureHive.readIdWebPerson();
      final response = await repository.validateQrFromProdemMovil(
        token,
        idWebClient,
        event.qrCode,
      );
      emit(ValidateQrFromProdemMovilSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(ValidateQrFromProdemMovilError(error.message));
        case "dio_unexpected":
          emit(
            ValidateQrFromProdemMovilError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
