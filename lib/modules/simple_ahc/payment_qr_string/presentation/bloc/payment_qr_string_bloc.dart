import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/domain/repositories/payment_qr_string_repository.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

part 'payment_qr_string_event.dart';
part 'payment_qr_string_state.dart';

class PaymentQrStringBloc
    extends Bloc<PaymentQrStringEvent, PaymentQrStringState> {
  PaymentQrStringRepository repository;
  PaymentQrStringBloc(this.repository) : super(PaymentQrStringInitial()) {
    on<PaymentQrEvent>(paymentQrStringBloc);
  }

  Future<void> paymentQrStringBloc(
    PaymentQrEvent event,
    Emitter<PaymentQrStringState> emit,
  ) async {
    emit(PaymentQrStringLoading());
    try {
      String idWebClient = SecureHive.readIdWebPerson();
      String idUSer = SecureHive.readIdUser();
      String idPerson = SecureHive.readIdPerson();
      final token = SecureHive.readToken();
      final ip = await IpHelper.getDeviceIp();
      final imei = await DeviceInfoHelper.getDeviceIdentifier();
      final location = GeolocationHelper.getLocationJson().toString();
      final response = await repository.paymentQrString(
        event.codeQr,
        event.receiverName,
        event.receiverIdentityCardNumber,
        event.bankCode,
        event.codeAccountDestiny,
        event.codeMoney,
        event.amount,
        event.isSingleUse,
        event.expirationDate,
        event.codeService,
        event.reference,
        event.stringQr,
        event.codePaymentAccount,
        idPerson,
        idWebClient,
        ip,
        idUSer,
        location,
        imei,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(PaymentQrStringSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(PaymentQrStringError(error.message));
        case "dio_unexpected":
          emit(PaymentQrStringError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
