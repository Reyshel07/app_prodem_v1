import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/entity.dart';
import '../../../domain/repositories/repository.dart';
part 'validate_and_save_renovation_dpf_event.dart';
part 'validate_and_save_renovation_dpf_state.dart';

class ValidateAndSaveRenovationDpfBloc
    extends
        Bloc<
          ValidateAndSaveRenovationDpfEvent,
          ValidateAndSaveRenovationDpfState
        > {
  VerificaPlazoRenovacionRepository repository;
  ValidateAndSaveRenovationDpfBloc(this.repository)
    : super(ValidateAndSaveRenovationDpfInitial()) {
    on<ValidateAndSaveRenoDpfEvent>(validateAndSaveRenovationDpfBloc);
  }
  Future<void> validateAndSaveRenovationDpfBloc(
    ValidateAndSaveRenoDpfEvent event,
    Emitter<ValidateAndSaveRenovationDpfState> emit,
  ) async {
    emit(ValidateAndSaveRenovationDpfLoading());
    try {
      final token = SecureHive.readToken();
      final idUser = SecureHive.readIdUser();
      String idPersonWeb = SecureHive.readIdWebPerson();
      final idPerson = SecureHive.readIdPerson();
      final ip = await IpHelper.getDeviceIp();
      final location = GeolocationHelper.getLocationJson().toString();
      final response = await repository.validateAndSaveRenovationDpf(
        event.idRenovationDPF,
        event.idcDPFMFInitial,
        event.idcDPFMFNew,
        event.idcOperationType,
        event.cellPhone,
        event.email,
        event.idDpfOffice,
        idPersonWeb,
        event.amount,
        event.termInDays,
        event.rate,
        event.interestEarned,
        event.finalAmount,
        event.originResources,
        event.idcState,
        location,
        event.contextData,
        ip,
        event.solicitationDate,
        event.idMoney,
        event.fullName,
        event.idSavingsAccount,
        event.codeSMS,
        idUser,
        event.withProdemKey,
        event.isDpfEmployee,
        event.codeSavingAccount,
        idPerson,
        event.idcOperationTypeAUX,
        event.idcInfoType,
        event.isAnotherAccount,
        event.amountOnAccount,
        event.oldAmount,
        event.interestAmountOld,
        event.capitalRenew,
        event.renewalTax,
        event.closingTax,
        event.idDepositProduct,
        event.depositProduct,
        event.hashTracking,
        event.isPignorado,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(ValidateAndSaveRenovationDpfSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(ValidateAndSaveRenovationDpfError(error.message));
        case "dio_unexpected":
          emit(
            ValidateAndSaveRenovationDpfError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
