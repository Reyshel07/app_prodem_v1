import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/domain/entities/atm_transaction_qr_create_entity.dart';
import 'package:app_prodem_v1/modules/ATM/atm_transaction_qr_create/domain/repositories/atm_transaction_qr_create_repository.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'atm_transaction_qr_create_event.dart';
part 'atm_transaction_qr_create_state.dart';

class AtmTransactionQrCreateBloc
    extends Bloc<AtmTransactionQrCreateEvent, AtmTransactionQrCreateState> {
  AtmTransactionQrCreateRepository repository;
  AtmTransactionQrCreateBloc(this.repository)
    : super(AtmTransactionQrCreateInitial()) {
    on<AtmTansactionQrCreEvent>(atmTransactionQrCreateBloc);
  }

  Future<void> atmTransactionQrCreateBloc(
    AtmTansactionQrCreEvent event,
    Emitter<AtmTransactionQrCreateState> emit,
  ) async {
    emit(AtmTransactionQrCreateLoading());
    try {
      final token = SecureHive.readToken();
      final idUser = SecureHive.readIdUser();
      String idWebClient = SecureHive.readIdWebPerson();
      final ip = await IpHelper.getDeviceIp();

      final location = GeolocationHelper.getLocationJson().toString();

      final response = await repository.atmTransactionQrCreate(
        token,
        event.aTMTransactionCode,
        event.amountWithdrawn,
        event.deviceIdentifier,
        event.idATMEntity,
        event.idSavingAccount,
        idUser,
        idWebClient,
        ip,
        location,
        event.qRGenerated,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(AtmTransactionQrCreateSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(AtmTransactionQrCreateError(error.message));
        case "dio_unexpected":
          emit(
            AtmTransactionQrCreateError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
