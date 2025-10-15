import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'create_pr_key_event.dart';
part 'create_pr_key_state.dart';

class CreatePrKeyBloc extends Bloc<CreatePrKeyEvent, CreatePrKeyState> {
  KeyPrRepository keyPrRepository;
  CreatePrKeyBloc(this.keyPrRepository) : super(CreatePrKeyInitial()) {
    on<CreatePrKeyEvent>(createPrKey);
  }

  Future<void> createPrKey(
    CreatePrKeyEvent event,
    Emitter<CreatePrKeyState> emit,
  ) async {
    emit(CreatePrKeyLoading());
    try {
      String idUser = '350923';//SecureHive.readIdUser().toString(); // '350880';
      String idWebOperation = '2';
      String idWebPersonClient =
          SecureHive.readIdWebPerson(); //1129150143954615';
      final location = await GeolocationHelper.getLocationJson();
      final ip = await IpHelper.getDeviceIp();
      final token = SecureHive.readToken();
      String imei = await DeviceInfoHelper.getDeviceIdentifier();
      final response = await keyPrRepository.createPrKey(
        idUser,
        idWebOperation,
        idWebPersonClient,
        token,
        location,
        ip,
        imei,
      );
      emit(CreatePrKeySuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(CreatePrKeyError(error.message));
        case "dio_unexpected":
          emit(CreatePrKeyError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
