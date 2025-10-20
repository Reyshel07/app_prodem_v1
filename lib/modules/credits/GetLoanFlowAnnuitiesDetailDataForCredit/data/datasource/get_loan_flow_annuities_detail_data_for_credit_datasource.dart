import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/data/models/get_loan_flow_annuities_detail_data_for_credit_model.dart';
import 'package:app_prodem_v1/modules/credits/GetLoanFlowAnnuitiesDetailDataForCredit/domain/entities/get_loan_flow_annuities_detail_data_for_credit_entity.dart';

class GetLoanFlowAnnuitiesDetailDataForCreditDatasource {
  final ApiClient _apiClient;
  GetLoanFlowAnnuitiesDetailDataForCreditDatasource(this._apiClient);

  Future<GetLoanFlowAnnuitiesDetailDataForCreditResponseEntity>
  getLoanFlowAnnDetDataForCredit(
    String? vToken,
    String? idLoanCredit,
    String? idPerson,
    String? idUser,
    String? iMEI,
    String? location,
    String? ipAddress,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getLoanFlowAnnuitiesDetailDataForCredit,
      data: {
        "IdLoanCredit": idLoanCredit,
        "IdPerson": idPerson,
        "IdUser": idUser,
        "IMEI": "abc123",
        "location": "",
        "IpAddress": "",
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'obtain detail credit',
    );
    return GetLoanFlowAnnuitiesDetailDataForCreditResponseModel.fromJson(
      response,
    );
  }
}
