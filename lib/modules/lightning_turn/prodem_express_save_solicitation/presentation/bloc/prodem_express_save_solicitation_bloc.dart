import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';

part 'prodem_express_save_solicitation_event.dart';
part 'prodem_express_save_solicitation_state.dart';

class ProdemExpressSaveSolicitationBloc
    extends
        Bloc<
          ProdemExpressSaveSolicitationEvent,
          ProdemExpressSaveSolicitationState
        > {
  ProdemExpressSaveSolicitationRepository repository;
  ProdemExpressSaveSolicitationBloc(this.repository)
    : super(ProdemExpressSaveSolicitationInitial()) {
    on<ProdemExpressSaveSoliEvent>(prodemExpressSaveSolicitationBloc);
  }
  Future<void> prodemExpressSaveSolicitationBloc(
    ProdemExpressSaveSoliEvent event,
    Emitter<ProdemExpressSaveSolicitationState> emit,
  ) async {
    emit(ProdemExpressSaveSolicitationLoading());
    try {
      final token = SecureHive.readToken();
      final idPerson = SecureHive.readIdPerson();
      final idUser = SecureHive.readIdUser();
      String location = await GeolocationHelper.getLocationJson();
      String ip = await IpHelper.getDeviceIp();
      String imei = await DeviceInfoHelper.getDeviceIdentifier();
      final response = await repository.prodemExpressSaveSolicitation(
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
        event.codeSavingAccountSource,
        event.amountTransaction,
        event.idMoney,
        idPerson,
        event.beneficiaryDI,
        event.beneficiaryName,
        event.beneficiaryCellphone,
        event.reasonSolicitation,
        event.isNaturalClient,
        idUser,
        imei,
        location,
        ip,
      );
      emit(ProdemExpressSaveSolicitationSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(ProdemExpressSaveSolicitationError(error.message));
        case "dio_unexpected":
          emit(
            ProdemExpressSaveSolicitationError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
