import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/domain/entities/get_valid_account_entity.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_valid_account/domain/repositories/get_valid_account_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_valid_account_event.dart';
part 'get_valid_account_state.dart';

class GetValidAccountBloc
    extends Bloc<GetValidAccountEvent, GetValidAccountState> {
  GetValidAccountRepository repository;
  GetValidAccountBloc(this.repository) : super(GetValidAccountInitial()) {
    on<GetValidAEvent>(getValidAccount);
  }

  Future<void> getValidAccount(
    GetValidAEvent event,
    Emitter<GetValidAccountState> emit,
  ) async {
    emit(GetValidAccountLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getValidA(
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
