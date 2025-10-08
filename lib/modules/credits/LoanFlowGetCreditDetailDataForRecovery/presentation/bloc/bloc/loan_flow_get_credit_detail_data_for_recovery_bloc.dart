import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/entities/loan_flow_get_credit_detail_data_for_recovery_entity.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/repositories/loan_flow_get_credit_detail_data_for_recovery_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'loan_flow_get_credit_detail_data_for_recovery_event.dart';
part 'loan_flow_get_credit_detail_data_for_recovery_state.dart';

class LoanFlowGetCreditDetailDataForRecoveryBloc extends Bloc<LoanFlowGetCreditDetailDataForRecoveryEvent, LoanFlowGetCreditDetailDataForRecoveryState> {
  final LoanFlowGetCreditDetailDataForRecoveryRepository repository;

  LoanFlowGetCreditDetailDataForRecoveryBloc(this.repository) : super(LoanFlowGetCreditDetailDataForRecoveryInitial()) {
    on<LoanFlowGetCredDetDatForRecoveryEvent>(loanFlowGetCredDetDatForRecoveryEvent);
  }

  Future<void> loanFlowGetCredDetDatForRecoveryEvent(
    LoanFlowGetCredDetDatForRecoveryEvent event,
    Emitter<LoanFlowGetCreditDetailDataForRecoveryState> emit,
  )async{
    emit(LoanFlowGetCreditDetailDataForRecoveryLoading());
    try{
      final token = SecureHive.readToken();
      
      final response = await repository.loanFlowGetCreDetDatForRecovery(token, 
      event.idLoanCredit,
      event.idSavingAccount);
    
      emit(LoanFlowGetCreditDetailDataForRecoverySuccess(response.data));
    }on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(LoanFlowGetCreditDetailDataForRecoveryError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(LoanFlowGetCreditDetailDataForRecoveryError("Ocurrió un error, no tiene internet"));
      } else {
        emit(LoanFlowGetCreditDetailDataForRecoveryError(error.message));
      }
    }
  }
}
