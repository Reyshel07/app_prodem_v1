part of 'get_loan_flow_annuities_detail_data_for_credit_bloc.dart';

sealed class GetLoanFlowAnnuitiesDetailDataForCreditEvent {}

class GetLoanFlowAnnuDetDataForCreditEvent  extends GetLoanFlowAnnuitiesDetailDataForCreditEvent {
    final String idLoanCredit;
    final String idPerson;
    final String idUser;
    final String iMEI;
    final String location;
    final String ipAddress;

  GetLoanFlowAnnuDetDataForCreditEvent({required this.idLoanCredit,required this.idPerson,required this.idUser,required this.iMEI,required this.location,required this.ipAddress});
}