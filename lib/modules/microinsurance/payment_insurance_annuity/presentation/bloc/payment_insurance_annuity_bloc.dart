import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/domain/repositories/payment_insurance_annuity_repository.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
part 'payment_insurance_annuity_event.dart';
part 'payment_insurance_annuity_state.dart';

class PaymentInsuranceAnnuityBloc
    extends Bloc<PaymentInsuranceAnnuityEvent, PaymentInsuranceAnnuityState> {
  PaymentInsuranceAnnuityRepository repository;
  PaymentInsuranceAnnuityBloc(this.repository)
    : super(PaymentInsuranceAnnuityInitial()) {
    on<PaymentInsuAnnuEvent>(paymentInsuranceAnnuityBloc);
  }
  Future<void> paymentInsuranceAnnuityBloc(
    PaymentInsuAnnuEvent event,
    Emitter<PaymentInsuranceAnnuityState> emit,
  ) async {
    emit(PaymentInsuranceAnnuityLoading());
    try {
      final token = SecureHive.readToken();
      final idUser = SecureHive.readIdUser();
      String idWebClient = SecureHive.readIdWebPerson();
      final ip = await IpHelper.getDeviceIp();
      final imei = await DeviceInfoHelper.getDeviceIdentifier();
      final location = GeolocationHelper.getLocationJson().toString();
      final response = await repository.paymentInsuranceAnnuity(
        event.idInsuranceAnnuity,
        idWebClient,
        event.idSavingAccount,
        imei,
        idUser,
        location,
        ip,
        event.isOwnInsurance,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(PaymentInsuranceAnnuitySuccess(response));
      ;
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(PaymentInsuranceAnnuityError(error.message));
        case "dio_unexpected":
          emit(
            PaymentInsuranceAnnuityError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
