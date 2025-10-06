import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/data/datasource/get_loan_flow_annuities_detail_data_for_credit_datasource.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/domain/entities/get_loan_flow_annuities_detail_data_for_credit_entity.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/domain/repositories/get_loan_flow_annuities_detail_data_for_credit_repository.dart';

class GetLoanFlowAnnuitiesDetailDataForCreditRepositoryImpl extends GetLoanFlowAnnuitiesDetailDataForCreditRepository {
  GetLoanFlowAnnuitiesDetailDataForCreditDatasource datasource;
  GetLoanFlowAnnuitiesDetailDataForCreditRepositoryImpl ({required this.datasource});

  
  
  @override
  Future<GetLoanFlowAnnuitiesDetailDataForCreditResponseEntity> getLoanFlowAnnDetDatForCredit(String? vToken, String? idLoanCredit, String? idPerson, String? idUser, String? iMEI, String? location, String? ipAddress) {
    return datasource.getLoanFlowAnnDetDataForCredit(vToken, idLoanCredit, idPerson, idUser, iMEI, location, ipAddress);
  }}