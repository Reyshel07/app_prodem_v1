part of 'get_loan_flow_annuities_detail_data_for_credit_bloc.dart';

sealed class GetLoanFlowAnnuitiesDetailDataForCreditEvent {}

class GetLoanFlowAnnuDetDataForCreditEvent  extends GetLoanFlowAnnuitiesDetailDataForCreditEvent {
    final String idLoanCredit;
  

  GetLoanFlowAnnuDetDataForCreditEvent({required this.idLoanCredit});
}