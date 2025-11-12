import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/domain/repositories/get_ach_banck_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entity.dart';
part 'get_valid_account_event.dart';
part 'get_valid_account_state.dart';

class GetValidAccountBloc
    extends Bloc<GetValidAccountEvent, GetValidAccountState> {
  GetAchBanckRepository repository;
  GetValidAccountBloc(this.repository) : super(GetValidAccountInitial()) {
    on<GetValidAccoEvent>(getValidAccountBloc);
  }

  Future<void> getValidAccountBloc(
    GetValidAccoEvent event,
    Emitter<GetValidAccountState> emit,
  ) async {
    emit(GetValidAccountLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getValidAccount(
        event.idbank,
        event.accountNumber,
        token,
      );
      emit(GetValidAccountSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetValidAccountError(error.message));
        case "dio_unexpected":
          emit(GetValidAccountError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
