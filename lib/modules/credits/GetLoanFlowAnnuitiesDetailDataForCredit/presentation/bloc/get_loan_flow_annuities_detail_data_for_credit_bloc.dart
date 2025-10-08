import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/domain/entities/get_loan_flow_annuities_detail_data_for_credit_entity.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/domain/repositories/get_loan_flow_annuities_detail_data_for_credit_repository.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_loan_flow_annuities_detail_data_for_credit_event.dart';
part 'get_loan_flow_annuities_detail_data_for_credit_state.dart';

class GetLoanFlowAnnuitiesDetailDataForCreditBloc extends Bloc<GetLoanFlowAnnuitiesDetailDataForCreditEvent, GetLoanFlowAnnuitiesDetailDataForCreditState> {
  
  final GetLoanFlowAnnuitiesDetailDataForCreditRepository repository;

  GetLoanFlowAnnuitiesDetailDataForCreditBloc(this.repository) : super(GetLoanFlowAnnuitiesDetailDataForCreditInitial()) {
    on<GetLoanFlowAnnuDetDataForCreditEvent> (getLoanFlowAnnDetDatForCredit);
  }

  Future<void> getLoanFlowAnnDetDatForCredit(
    GetLoanFlowAnnuDetDataForCreditEvent event,
    Emitter<GetLoanFlowAnnuitiesDetailDataForCreditState> emit,
  )async{
    emit(GetLoanFlowAnnuitiesDetailDataForCreditLoading());
    try{
      final token = SecureHive.readToken();
      final idPerson = SecureHive.readIdPerson();
      final idUser = SecureHive.readIdUser();
      final location = GeolocationHelper.getLocationJson().toString();
      final imei = "";
      final ipadd = "";
      final response = await repository.getLoanFlowAnnDetDatForCredit(token, 
      event.idLoanCredit,
      idPerson,
      idUser,
      imei,
      location,
      ipadd);
    
      emit(GetLoanFlowAnnuitiesDetailDataForCreditSuccess(response.data));
    }on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(GetLoanFlowAnnuitiesDetailDataForCreditError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(GetLoanFlowAnnuitiesDetailDataForCreditError("Ocurrió un error, no tiene internet"));
      } else {
        emit(GetLoanFlowAnnuitiesDetailDataForCreditError(error.message));
      }
    }
  }
}
