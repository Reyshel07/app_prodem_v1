import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/bank_security_solicitation_result/domain/repositories/bank_security_solicitation_result_repository.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/secure_hive.dart';
import '../../domain/entities/entity.dart';
part 'bank_security_solicitation_result_event.dart';
part 'bank_security_solicitation_result_state.dart';

class BankSecuritySolicitationResultBloc
    extends
        Bloc<
          BankSecuritySolicitationResultEvent,
          BankSecuritySolicitationResultState
        > {
  BankSecuritySolicitationResultRepository repository;
  BankSecuritySolicitationResultBloc(this.repository)
    : super(BankSecuritySolicitationResultInitial()) {
    on<BankSecuritySolicitationResEvent>(bankSecuritySolicitationResultBloc);
  }
  Future<void> bankSecuritySolicitationResultBloc(
    BankSecuritySolicitationResEvent event,
    Emitter<BankSecuritySolicitationResultState> emit,
  ) async {
    emit(BankSecuritySolicitationResultLoading());
    try {
      ///completo
      final token = SecureHive.readToken();
      final idUser = SecureHive.readIdUser();
      String idWebClient = SecureHive.readIdWebPerson();
      final idPerson = SecureHive.readIdPerson();
      final ip = await IpHelper.getDeviceIp();
      final imei = await DeviceInfoHelper.getDeviceIdentifier();
      final location = GeolocationHelper.getLocationJson().toString();
      final response = await repository.bankSecuritySolicitationResult(
        event.activocirculante,
        event.activofijo,
        event.beneficiario,
        event.codeSavingsAccountOrigin,
        event.costodeVentas,
        event.cUCE,
        event.fechaInicioString,
        event.gastosfamiliares,
        event.gastosOperativos,
        event.idBankGuaranteeClass,
        event.idBankGuaranteeProduct,
        event.idMoneda,
        event.idMonedaCuenta,
        event.idOfficeTarget,
        idPerson,
        event.idSavingAccount,
        idUser,
        idWebClient,
        event.identityCardNumber,
        imei,
        ip,
        location,
        event.moneda,
        event.monedaCuenta,
        event.montoSolicitado,
        event.nroEmpleados,
        event.objetoBoleta,
        event.otrosactivos,
        event.otrosIngresos,
        event.pagopasivos,
        event.pasivos,
        event.personName,
        event.plazo,
        event.proposito,
        event.tipoBoleta,
        event.ventasMensualesBrutas,
        event.codeOffice,
        event.officeName,
        event.siregarName,
        event.departamento,
        event.idClasificador,
        event.code,
        event.nombre,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(BankSecuritySolicitationResultSuccess(response));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(BankSecuritySolicitationResultError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(
          BankSecuritySolicitationResultError(
            "Ocurrió un error, no tiene internet",
          ),
        );
      } else {
        emit(BankSecuritySolicitationResultError(error.message));
      }
    }
  }
}
