import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'saving_account_transfer_mobile_event.dart';
part 'saving_account_transfer_mobile_state.dart';

class SavingAccountTransferMobileBloc
    extends
        Bloc<
          SavingAccountTransferMobileEvent,
          SavingAccountTransferMobileState
        > {
  SavingAccountTransferMobileRepository repository;
  SavingAccountTransferMobileBloc(this.repository)
    : super(SavingAccountTransferMobileInitial()) {
    on<SavingAccountTransMoEvent>(savingAccountTransferMobile);
  }

  Future<void> savingAccountTransferMobile(
    SavingAccountTransMoEvent event,
    Emitter<SavingAccountTransferMobileState> emit,
  ) async {
    emit(SavingAccountTransferMobileLoading());
    try {
      String idPerson =SecureHive.readIdPerson();// '17000000000003984';
      bool applyGeneratePCC01 = false;
      String depositorName = '';
      String depositorDI = '';
      String idUser =SecureHive.readIdUser();// '350880';
      String imei = await DeviceInfoHelper.getDeviceIdentifier() ;
      String location = await GeolocationHelper.getLocationJson();
      String ipAddress = await IpHelper.getDeviceIp();
      final token = SecureHive.readToken();
      final response = await repository.savingAccountTransMobile(
        event.codeSavingAccountSource,
        idPerson,
        event.codeSavingAccountTarget,
        event.amountTransfer,
        event.idMoneyTransfer,
        event.isNaturalCustomer,
        event.observation,
        event.reasonDestiny,
        applyGeneratePCC01,
        event.typeApplicationAccessX,
        depositorName,
        depositorDI,
        event.idTerminal,
        event.userAppOriginType,
        idUser,
        imei,
        location,
        ipAddress,
        event.beneficiaryName,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(SavingAccountTransferMobileSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(SavingAccountTransferMobiletaError(error.message));
        case "dio_unexpected":
          emit(
            SavingAccountTransferMobiletaError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
