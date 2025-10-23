import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/credit_card/make_payment_credit_card_for_mobile/domain/repositories/repository.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'make_payment_credit_card_for_mobile_event.dart';
part 'make_payment_credit_card_for_mobile_state.dart';

class MakePaymentCreditCardForMobileBloc
    extends
        Bloc<
          MakePaymentCreditCardForMobileEvent,
          MakePaymentCreditCardForMobileState
        > {
  MakePaymentCreditCardForMobileRepository repository;
  MakePaymentCreditCardForMobileBloc(this.repository)
    : super(MakePaymentCreditCardForMobileInitial()) {
    on<MakePaymentCreditCardForMoEvent>(makePaymentCreditCardForMobileBloc);
  }

  Future<void> makePaymentCreditCardForMobileBloc(
    MakePaymentCreditCardForMoEvent event,
    Emitter<MakePaymentCreditCardForMobileState> emit,
  ) async {
    emit(MakePaymentCreditCardForMobileLoading());
    try {
      final token = SecureHive.readToken();
      final idPerson = SecureHive.readIdPerson();
      final idUser = SecureHive.readIdUser();
      String location = await GeolocationHelper.getLocationJson();
      String ip = await IpHelper.getDeviceIp();
      String imei = await DeviceInfoHelper.getDeviceIdentifier();
      final isNaturalPerson = true;
      final response = await repository.makePaymentCreditCardForMobile(
        event.idCreditLineInstance,
        event.idSavingAccount,
        event.amountPayment,
        event.idLoanCurrency,
        event.idSavingAccountMoney,
        event.codeAuthentication,
        event.idPersonLogged,
        isNaturalPerson,
        event.creditCardAccountNumber,
        event.customerName,
        idPerson,
        idUser,
        imei,
        location,
        ip,
        event.isOwnCreditCard,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(MakePaymentCreditCardForMobileSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(MakePaymentCreditCardForMobileError(error.message));
        case "dio_unexpected":
          emit(
            MakePaymentCreditCardForMobileError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
