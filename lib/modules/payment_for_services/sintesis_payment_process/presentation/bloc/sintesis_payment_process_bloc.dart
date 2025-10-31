import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'sintesis_payment_process_event.dart';
part 'sintesis_payment_process_state.dart';

class SintesisPaymentProcessBloc
    extends Bloc<SintesisPaymentProcessEvent, SintesisPaymentProcessState> {
  SintesisPaymentProcessRepository repository;
  SintesisPaymentProcessBloc(this.repository)
    : super(SintesisPaymentProcessInitial()) {
    on<SintesisPaymentProEvent>(sintesisPaymentProcessBloc);
  }

  Future<void> sintesisPaymentProcessBloc(
    SintesisPaymentProEvent event,
    Emitter<SintesisPaymentProcessState> emit,
  ) async {
    emit(SintesisPaymentProcessLoading());
    try {
      final token = SecureHive.readToken();
      String idWebClient = SecureHive.readIdWebPerson();
      final idUser = SecureHive.readIdUser();
      String location = await GeolocationHelper.getLocationJson();
      String ip = await IpHelper.getDeviceIp();
      String imei = await DeviceInfoHelper.getDeviceIdentifier();
      final response = await repository.sintesisPaymentProcess(
        event.idUser,
        event.idOffice,
        event.idCustomer,
        idWebClient,
        event.invoiceNIT,
        event.invoiceName,
        event.invoiceCustomerEmail,
        event.invoiceDocumentType,
        event.invoiceDocumentComplement,
        event.invoicePhone,
        event.idExternalSystem,
        event.searchData,
        event.idMoney,
        event.mFServiceCode,
        event.externalSystemPaymentID,
        event.totalToPay,
        event.isMobile,
        event.idSavingAccount,
        event.numberTranCAI,
        event.serieCAI,
        event.createInvoicingPendding,
        event.codeAuthentication,
        event.externalModule,
        event.savingAccountOperation,
        event.useCode,
        location,
        event.deviceIMEI,
        event.operationNumber,
        event.operativeDate,
        event.accountCode,
        event.serviceCode,
        event.collectionType,
        event.carDepartment,
        event.carType,
        event.carUseType,
        event.userToken,
        event.codeSintesisModule,
        event.codesavingAccount,
        event.codeMoney,
        idUser,
        imei,
        ip,
        event.itemNumberCode,
        event.itemAmount,
        event.batchDosage,
        event.rentNumber,
        event.itemPeriod,
        event.itemDescription,
        event.itemDate,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(SintesisPaymentProcessSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(SintesisPaymentProcessError(error.message));
        case "dio_unexpected":
          emit(
            SintesisPaymentProcessError("Ocurrio un error, no tiene internet"),
          );
      }
    }
  }
}
