import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/domain/entities/get_loan_flow_annuities_detail_data_for_credit_entity.dart';

abstract class GetLoanFlowAnnuitiesDetailDataForCreditRepository {
  Future<GetLoanFlowAnnuitiesDetailDataForCreditResponseEntity> getLoanFlowAnnDetDatForCredit(
    String? vToken,
    String? idLoanCredit,
    String? idPerson,
    String? idUser,
    String? iMEI,
    String? location,
    String? ipAddress
  );
}