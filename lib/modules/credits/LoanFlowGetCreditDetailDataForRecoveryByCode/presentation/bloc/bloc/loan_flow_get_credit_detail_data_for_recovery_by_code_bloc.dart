import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/entities/loan_flow_get_credit_detail_data_for_recovery_by_code_entity.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/repositories/loan_flow_get_credit_detail_data_for_recovery_by_code_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'loan_flow_get_credit_detail_data_for_recovery_by_code_event.dart';
part 'loan_flow_get_credit_detail_data_for_recovery_by_code_state.dart';

class LoanFlowGetCreditDetailDataForRecoveryByCodeBloc
    extends
        Bloc<
          LoanFlowGetCreditDetailDataForRecoveryByCodeEvent,
          LoanFlowGetCreditDetailDataForRecoveryByCodeState
        > {
  final LoanFlowGetCreditDetailDataForRecoveryByCodeRepository repository;

  LoanFlowGetCreditDetailDataForRecoveryByCodeBloc(this.repository)
    : super(LoanFlowGetCreditDetailDataForRecoveryByCodeInitial()) {
    on<LoanFlowGetCreditDetailDataForRecoveryByCodeE>(
      loanFlowGetCreditDetailDataForRecoveryByCodeEvent,
    );
  }

  Future<void> loanFlowGetCreditDetailDataForRecoveryByCodeEvent(
    LoanFlowGetCreditDetailDataForRecoveryByCodeE event,
    Emitter<LoanFlowGetCreditDetailDataForRecoveryByCodeState> emit,
  ) async {
    emit(LoanFlowGetCreditDetailDataForRecoveryByCodeLoading());
    try {

       final token = SecureHive.readToken();

      final response = await repository .loanFlowGetCreDetDatForRecByCode(
        token,
        event.loanCreditCode,
        event.idSavingAccount);

       emit(LoanFlowGetCreditDetailDataForRecoveryByCodeSuccess(response.data));
    }on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(LoanFlowGetCreditDetailDataForRecoveryByCodeError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(LoanFlowGetCreditDetailDataForRecoveryByCodeError("Ocurrió un error, no tiene internet"));
      } else {
        emit(LoanFlowGetCreditDetailDataForRecoveryByCodeError(error.message));
      }
    }
  }
}
