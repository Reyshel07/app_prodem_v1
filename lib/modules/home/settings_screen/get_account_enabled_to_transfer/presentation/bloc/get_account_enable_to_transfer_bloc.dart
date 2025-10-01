import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'get_account_enable_to_transfer_event.dart';
part 'get_account_enable_to_transfer_state.dart';

class GetAccountEnableToTransferBloc
    extends
        Bloc<GetAccountEnableToTransferEvent, GetAccountEnableToTransferState> {
  GetAccountEnabledToTransferRepository repository;
  GetAccountEnableToTransferBloc(this.repository)
    : super(GetAccountEnableToTransferInitial()) {
    on<GetAccountEnableToTransferEvent>(getAccountEnableBloc);
    on<AccountEnableToTransSaveEvent>(accountEnableToTransferSaveBloc);
  }

  Future<void> getAccountEnableBloc(
    GetAccountEnableToTransferEvent event,
    Emitter<GetAccountEnableToTransferState> emit,
  ) async {
    emit(GetAccountEnableToTransferLoading());
    try {
      String idWebPersonClient = SecureHive.readIdWebPerson();
      final token = SecureHive.readToken();
      final response = await repository.getAccountenableToTransfer(
        idWebPersonClient,
        token,
      );
      emit(GetAccountEnableToTransferSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetAccountEnableToTransferError(error.message));
        case "dio_unexpected":
          emit(
            GetAccountEnableToTransferError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }

  Future<void> accountEnableToTransferSaveBloc(
    AccountEnableToTransSaveEvent event,
    Emitter<GetAccountEnableToTransferState> emit,
  ) async {
    emit(GetAccountEnableToTransferLoading());
    try {
      String idWebPersonClient = SecureHive.readIdWebPerson();
      final token = SecureHive.readToken();
      final response = await repository.accountEnableToTransSave(
        idWebPersonClient,
        event.idSavingAccount,
        event.codeAccount,
        event.isActive,
        token,
      );
      emit(AccountEnableToTransferSaveSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(GetAccountEnableToTransferError(error.message));
        case "dio_unexpected":
          emit(
            GetAccountEnableToTransferError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
