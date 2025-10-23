import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/credit_card/credit_card_data_for_recovery/domain/repositories/credit_car_data_for_recovery_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'credit_car_data_for_recovery_event.dart';
part 'credit_car_data_for_recovery_state.dart';

class CreditCarDataForRecoveryBloc
    extends Bloc<CreditCarDataForRecoveryEvent, CreditCarDataForRecoveryState> {
  CreditCarDataForRecoveryRepository repository;
  CreditCarDataForRecoveryBloc(this.repository)
    : super(CreditCarDataForRecoveryInitial()) {
    on<CreditCarDataForRecorEvent>(creditCarDataForRecoveryBloc);
  }
  Future<void> creditCarDataForRecoveryBloc(
    CreditCarDataForRecorEvent event,
    Emitter<CreditCarDataForRecoveryState> emit,
  ) async {
    emit(CreditCarDataForRecoveryLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.creditCardDataForRecovery(
        event.idCreditLineInstance,
        event.creditCardNumber,
        event.codeSavingAccountSource,
        event.amountOperation,
        event.idMoneyOperation,
        token,
      );
      emit(CreditCarDataForRecoverySuccess(response));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(CreditCarDataForRecoveryError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(
          CreditCarDataForRecoveryError("Ocurrió un error, no tiene internet"),
        );
      } else {
        emit(CreditCarDataForRecoveryError(error.message));
      }
    }
  }
}
