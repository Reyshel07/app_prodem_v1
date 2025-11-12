import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entity.dart';
import '../../../domain/repositories/repository.dart';
part 'get_saving_account_verfication_messages_event.dart';
part 'get_saving_account_verfication_messages_state.dart';

class GetSavingAccountVerficationMessagesBloc
    extends
        Bloc<
          GetSavingAccountVerficationMessagesEvent,
          GetSavingAccountVerficationMessagesState
        > {
  SintesisPaymentProcessRepository repository;
  GetSavingAccountVerficationMessagesBloc(this.repository)
    : super(GetSavingAccountVerficationMessagesInitial()) {
    on<GetSavingAccountVerficationMesEvent>(
      getSavingAccountVerficationMessagesBloc,
    );
  }

  Future<void> getSavingAccountVerficationMessagesBloc(
    GetSavingAccountVerficationMesEvent event,
    Emitter<GetSavingAccountVerficationMessagesState> emit,
  ) async {
    emit(GetSavingAccountVerficationMessagesLoading());
    try {
      final token = SecureHive.readToken();
      String savingOperation = '11854';
      final response = await repository.getSavingAccountVerficationMessages(
        event.idSavingAccount,
        event.idMoney,
        event.transactionAmount,
        savingOperation,
        token,
      );
      emit(GetSavingAccountVerficationMessagesSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetSavingAccountVerficationMessagesError(error.message));
        case "dio_unexpected":
          emit(
            GetSavingAccountVerficationMessagesError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
