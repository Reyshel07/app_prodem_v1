import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'data_account_for_mobiles_by_code_account_all_event.dart';
part 'data_account_for_mobiles_by_code_account_all_state.dart';

class DataAccountForMobilesByCodeAccountAllBloc
    extends
        //cambios
        Bloc<
          DataAccountForMobilesByCodeAccountAllEvent,
          DataAccountForMobilesByCodeAccountAllState
        > {
  DataAccountForMobilesByCodeAccountAllRepository repository;
  DataAccountForMobilesByCodeAccountAllBloc(this.repository)
    : super(DataAccountForMobilesByCodeAccountAllInitial()) {
    on<DataAccountForMobilesByCodeAccoAllEvent>(
      dataAccountForMobilesByCodeAccountAllBloc,
    );
  }
  Future<void> dataAccountForMobilesByCodeAccountAllBloc(
    DataAccountForMobilesByCodeAccoAllEvent event,
    Emitter<DataAccountForMobilesByCodeAccountAllState> emit,
  ) async {
    emit(DataAccountForMobilesByCodeAccountAllLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.dataAccountForMobiles(
        event.codeAccount,
        token,
      );
      emit(DataAccountForMobilesByCodeAccountAllSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(DataAccountForMobilesByCodeAccountAllError(error.message));
        case "dio_unexpected":
          emit(
            DataAccountForMobilesByCodeAccountAllError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
