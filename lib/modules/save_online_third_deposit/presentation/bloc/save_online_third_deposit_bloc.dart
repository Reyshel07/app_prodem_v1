import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/save_online_third_deposit/domain/repositories/save_online_third_deposit_repository.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

part 'save_online_third_deposit_event.dart';
part 'save_online_third_deposit_state.dart';

class SaveOnlineThirdDepositBloc
    extends Bloc<SaveOnlineThirdDepositEvent, SaveOnlineThirdDepositState> {
  SaveOnlineThirdDepositRepository repository;
  SaveOnlineThirdDepositBloc(this.repository)
    : super(SaveOnlineThirdDepositInitial()) {
    on<SaveOnlineThirdDepEvent>(saveOnlineThirdDepositBloc);
  }

  Future<void> saveOnlineThirdDepositBloc(
    SaveOnlineThirdDepEvent event,
    Emitter<SaveOnlineThirdDepositState> emit,
  ) async {
    emit(SaveOnlineThirdDepositLoading());
    try {
      String idPerson1 = SecureHive.readIdPerson(); // "17000000000003984";
      String idUser1 = '350921'; //SecureHive.readIdUser(); // "350880";
      String location = await GeolocationHelper.getLocationJson();
      String ip = await IpHelper.getDeviceIp();
      String imei = await DeviceInfoHelper.getDeviceIdentifier();
      final token = SecureHive.readToken();
      String idWebPersonClient = SecureHive.readIdWebPerson();
      final response = await repository.saveOnlineThirdDeposit(
        event.accountDestiny,
        event.accountOrigin,
        event.ammount,
        event.bankOrigin,
        event.customerDepositName,
        event.depositDate,
        event.depositVoucher,
        event.destinyOfFunds,
        event.idBankOrigin,
        event.idMoney,
        idPerson1,
        event.idSavingAccount,
        event.idThirdOnlineDeposit,
        idUser1,
        idWebPersonClient,
        event.idWebPersonClientCreate,
        event.idcOriginType,
        event.idcState,
        event.identityCardNumber,
        imei,
        ip,
        event.isOwnAccount,
        location,
        event.moneyCode,
        event.nombreCliente,
        event.observations,
        event.sourceOfFunds,
        event.usuarioRegistro,
        event.whatsAppNumber,
        event.idLoanCredit,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(SaveOnlineThirdDepositSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(SaveOnlineThirdDepositError(error.message));
        case "dio_unexpected":
          emit(
            SaveOnlineThirdDepositError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
