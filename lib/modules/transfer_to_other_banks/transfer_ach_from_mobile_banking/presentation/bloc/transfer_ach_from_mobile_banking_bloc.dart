import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/transfer_ach_from_mobile_banking/domain/repositories/transfer_ach_from_mobile_banking_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../transfer_between_accounts/savings_account_transfer_mobile/domain/entities/entity.dart';
part 'transfer_ach_from_mobile_banking_event.dart';
part 'transfer_ach_from_mobile_banking_state.dart';

class TransferAchFromMobileBankingBloc
    extends
        Bloc<
          TransferAchFromMobileBankingEvent,
          TransferAchFromMobileBankingState
        > {
  TransferAchFromMobileBankingRepository repository;
  TransferAchFromMobileBankingBloc(this.repository)
    : super(TransferAchFromMobileBankingInitial()) {
    on<TransferAchFromMobBanEvent>(transferAchFromMobileBankingBloc);
  }

  Future<void> transferAchFromMobileBankingBloc(
    TransferAchFromMobBanEvent event,
    Emitter<TransferAchFromMobileBankingState> emit,
  ) async {
    emit(TransferAchFromMobileBankingLoading());
    try {
      String idPerson = '17000000000003984';
      String idUser = '350880';
      String imei = '';
      String location = '';
      String ipAddress = '192.168.1.12';
      final token = SecureHive.readToken();
      final response = await repository.transferAchFromMobileB(
        event.beneficiary,
        event.identityCardNumber,
        event.accountNumber,
        event.commissionAmount,
        event.observation,
        event.idBankDestiny,
        event.idMoney,
        event.idSavingAccount,
        event.amount,
        event.amountSolicitation,
        idPerson,
        event.idWebPersonClient,
        event.applyGeneratePCC01,
        event.reasonDestinyPCC01,
        idUser,
        imei,
        location,
        ipAddress,
        event.bankDestinyName,
        token,
        event.idSMSOperation,
        event.prodemKeyCode,
      );
      emit(TransferAchFromMobileBankingSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(TransferAchFromMobileBankingError(error.message));
        case "dio_unexpected":
          emit(
            TransferAchFromMobileBankingError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
