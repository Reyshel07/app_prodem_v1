import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/domain/entities/get_ach_data_entity.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/domain/repositories/get_ach_data_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_ach_data_event.dart';
part 'get_ach_data_state.dart';

class GetAchDataBloc extends Bloc<GetAchDataEvent, GetAchDataState> {
  GetAchDataRepository repository;
  GetAchDataBloc(this.repository) : super(GetAchDataInitial()) {
    on<GetAchDaEvent>(getAchDataBloc);
  }

  Future<void> getAchDataBloc(
    GetAchDaEvent event,
    Emitter<GetAchDataState> emit,
  ) async {
    emit(GetAchDataLoading());
    try {
      String idPerson = SecureHive.readIdPerson();
      final token = SecureHive.readToken();
      final response = await repository.getAchData(
        event.idSavingsAccount,
        event.amountTransaction,
        event.idMoney,
        idPerson,
        event.isNaturalClient,
        token,
      );
      emit(GetAchDataSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetAchDataError(error.message));
        case "dio_unexpected":
          emit(GetAchDataError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
