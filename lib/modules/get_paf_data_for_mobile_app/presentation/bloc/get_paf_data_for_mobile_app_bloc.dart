import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';

part 'get_paf_data_for_mobile_app_event.dart';
part 'get_paf_data_for_mobile_app_state.dart';

class GetPafDataForMobileAppBloc
    extends Bloc<GetPafDataForMobileAppEvent, GetPafDataForMobileAppState> {
  GetPafDataForMobileAppRepository repository;
  GetPafDataForMobileAppBloc(this.repository)
    : super(GetPafDataForMobileAppInitial()) {
    on<GetPafDataForMobileApEvent>(getPafDataForMobileAppBloc);
  }

  Future<void> getPafDataForMobileAppBloc(
    GetPafDataForMobileApEvent event,
    Emitter<GetPafDataForMobileAppState> emit,
  ) async {
    emit(GetPafDataForMobileAppLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getPafDataForMobileApp(token);
      emit(GetPafDataForMobileAppSuccess(response));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(GetPafDataForMobileAppError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(
          GetPafDataForMobileAppError("Ocurrió un error, no tiene internet"),
        );
      } else {
        emit(GetPafDataForMobileAppError(error.message));
      }
    }
  }
}
