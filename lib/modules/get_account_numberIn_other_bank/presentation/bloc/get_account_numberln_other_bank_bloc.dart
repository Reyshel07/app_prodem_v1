import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/domain/entities/get_account_numberln_other_bank_entity.dart';
import 'package:app_prodem_v1/modules/get_account_numberIn_other_bank/domain/repositories/get_account_numberln_other_bank_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_account_numberln_other_bank_event.dart';
part 'get_account_numberln_other_bank_state.dart';

class GetAccountNumberlnOtherBankBloc
    extends
        Bloc<
          GetAccountNumberlnOtherBankEvent,
          GetAccountNumberlnOtherBankState
        > {
  GetAccountNumberlnOtherBankRepository repository;
  GetAccountNumberlnOtherBankBloc(this.repository)
    : super(GetAccountNumberlnOtherBankInitial()) {
    on<GetAccountNumOtherBankEvent>(accountNumberlnOtherBankBloc);
  }

  Future<void> accountNumberlnOtherBankBloc(
    GetAccountNumOtherBankEvent event,
    Emitter<GetAccountNumberlnOtherBankState> emit,
  ) async {
    emit(GetAccountNumberlnOtherBankLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.accountNumberlnOtherBank(token);
      emit(GetAccountNumberlnOtherBankSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetAccountNumberlnOtherBankError(error.message));
        case "dio_unexpected":
          emit(
            GetAccountNumberlnOtherBankError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
