import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';

part 'saving_account_data_event.dart';
part 'saving_account_data_state.dart';

class SavingAccountDataBloc
    extends Bloc<SavingAccountDataEvent, SavingAccountDataState> {
  SavingAccountDataRepository repository;
  SavingAccountDataBloc(this.repository) : super(SavingAccountDataInitial()) {
    on<SavingAccountDEvent>(savingAccountData);
    on<GetAccountByPhoneNum>(getAccountByPhoneNumBloc);
  }

  Future<void> savingAccountData(
    SavingAccountDEvent event,
    Emitter<SavingAccountDataState> emit,
  ) async {
    emit(SavingAccountDataLoading());
    try {
      String idPerson = SecureHive.readIdPerson(); // '17000000000003984';
      final token = SecureHive.readToken();
      final response = await repository.sanvinAccountData(
        event.codeSavingAccountSource,
        event.codeSavingAccount,
        event.idMoneyOperation,
        event.amountOperation,
        idPerson,
        token,
      );
      emit(SavingAccountDataSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(SavingAccountDataError(error.message));
        case "dio_unexpected":
          emit(SavingAccountDataError("Ocurrio un error, no tiene internet"));
      }
    }
  }

  Future<void> getAccountByPhoneNumBloc(
    GetAccountByPhoneNum event,
    Emitter<SavingAccountDataState> emit,
  ) async {
    emit(SavingAccountDataLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getAAccountByPhoneNum(
        token,
        event.phoneNumber,
      );
      emit(GetAccountByPhoneNumSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(SavingAccountDataError(error.message));
        case "dio_unexpected":
          emit(SavingAccountDataError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
