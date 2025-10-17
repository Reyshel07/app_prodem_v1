import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/repositories/loan_flow_payment_credit_third_repository.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
part 'loan_flow_payment_credit_third_event.dart';
part 'loan_flow_payment_credit_third_state.dart';

class LoanFlowPaymentCreditThirdBloc
    extends
        Bloc<LoanFlowPaymentCreditThirdEvent, LoanFlowPaymentCreditThirdState> {
  final LoanFlowPaymentCreditThirdRepository repository;

  LoanFlowPaymentCreditThirdBloc(this.repository)
    : super(LoanFlowPaymentCreditThirdInitial()) {
    on<LoanFlowPaymentCreditThirdE>(loanFlowPaymentCreditThirdEvent);
  }

  Future<void> loanFlowPaymentCreditThirdEvent(
    LoanFlowPaymentCreditThirdE event,
    Emitter<LoanFlowPaymentCreditThirdState> emit,
  ) async {
    emit(LoanFlowPaymentCreditThirdLoading());
    try {
      final token = SecureHive.readToken();

      final idPerson = SecureHive.readIdPerson();
      final idUser = '350923'; //SecureHive.readIdUser();
      final location = GeolocationHelper.getLocationJson().toString();
      final personNatural = true; //SecureHive.readIsPersonNatural();
      final imei = "";
      final ipadd = "";
      var idCustomer = 0;
      if (personNatural) {
        idCustomer = SecureHive.readIdPerson().toInt();
      }

      final codeAuthentication = "";
      final isNaturalCustomer = personNatural;
      final customerId = "";
      final customerName = "";

      final response = await repository.loanFlowPaymentCreditThird(
        token,
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
        event.prodemKeyCode,
      );

      emit(LoanFlowPaymentCreditThirdSuccess(response));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(LoanFlowPaymentCreditThirdError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(
          LoanFlowPaymentCreditThirdError(
            "Ocurrió un error, no tiene internet",
          ),
        );
      } else {
        emit(LoanFlowPaymentCreditThirdError(error.message));
      }
    }
  }
}
