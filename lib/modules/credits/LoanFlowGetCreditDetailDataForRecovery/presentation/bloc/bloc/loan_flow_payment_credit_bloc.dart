import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/repositories/loan_flow_payment_credit_repository.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

part 'loan_flow_payment_credit_event.dart';
part 'loan_flow_payment_credit_state.dart';

class LoanFlowPaymentCreditBloc extends Bloc<LoanFlowPaymentCreditEvent, LoanFlowPaymentCreditState> {
  final LoanFlowPaymentCreditRepository repository;

  LoanFlowPaymentCreditBloc(this.repository) : super(LoanFlowPaymentCreditInitial()) {
    on<LoanFlowPaymentCreditE>(loanFlowPaymentCreditEvent);
  }

  Future<void> loanFlowPaymentCreditEvent(
    LoanFlowPaymentCreditE event,
    Emitter<LoanFlowPaymentCreditState> emit,
    )async{
    emit(LoanFlowPaymentCreditLoading());
    try{
      final token = SecureHive.readToken();
      
      final idPerson = SecureHive.readIdPerson();
      final idUser = SecureHive.readIdUser();
      final location = GeolocationHelper.getLocationJson().toString();
      final personNatural = SecureHive.readIsPersonNatural();
      final imei = "";
      final ipadd = "";
      var idCustomer = 0;
      if (personNatural) {
        idCustomer = SecureHive.readIdPerson().toInt();
      }else{
        idCustomer = SecureHive.readIdWebPerson().toInt();
      };

      final codeAuthentication = "";
      final isNaturalCustomer = personNatural;
      final customerId = "";
      final customerName = "";


      final response = await repository.loanFlowPaymentCredit(token, 
      event.idLoanCredit,
      event.debitAmount,
      event.amountToPay,
      event.taxAmount,
      event.idLoanCurrency,
      event.withInsuranceReturn,
      event.idSavingAccount,
      event.loanCreditCode,
      idCustomer,
      codeAuthentication,
      isNaturalCustomer,
      idPerson,
      idUser,
      imei,
      location,
      ipadd,
      event.isOwnCredit,
      customerId,
      customerName,
      event.idSMSOperation,
      event.prodemKeyCode);

    
      emit(LoanFlowPaymentCreditSuccess(response));
    }on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(LoanFlowPaymentCreditError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(LoanFlowPaymentCreditError("Ocurrió un error, no tiene internet"));
      } else {
        emit(LoanFlowPaymentCreditError(error.message));
      }
    }
  }
}
