import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'saving_account_extrac_event.dart';
part 'saving_account_extrac_state.dart';

class SavingAccountExtracBloc
    extends Bloc<SavingAccountExtracEvent, SavingAccountExtracState> {
  SavingAccountExtracRespository savingAccountExtracRespository;
  SavingAccountExtracBloc(this.savingAccountExtracRespository)
    : super(SavingAccountExtracInitial()) {
    on<SavingAccountExEnevet>((savingAccountEx));
  }

  Future<void> savingAccountEx(
    SavingAccountExEnevet event,
    Emitter<SavingAccountExtracState> emit,
  ) async {
    emit(SavingAccountExtracLoading());
    try {
      final token = SecureHive.readToken();

      String idPerson = SecureHive.readIdPerson();// '17000000000003984';
      String idUser =SecureHive.readIdUser();// '350880';
      String location=await GeolocationHelper.getLocationJson();
      String  ip=await IpHelper.getDeviceIp();
      String imei=await DeviceInfoHelper.getDeviceIdentifier();
      final response = await savingAccountExtracRespository.savingAccountExtrac(
        event.codeSavingsAccount,
        idPerson,
        idUser,
        token,
        location,ip,imei
      );
      emit(SavingAccountExtracSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(SavingAccountExtracError(error.message));
        case "dio_unexpected":
          emit(SavingAccountExtracError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
