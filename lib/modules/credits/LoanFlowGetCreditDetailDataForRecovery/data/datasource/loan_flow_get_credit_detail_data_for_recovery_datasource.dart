import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/data/models/loan_flow_get_credit_detail_data_for_recovery_model.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/entities/loan_flow_get_credit_detail_data_for_recovery_entity.dart';

class LoanFlowGetCreditDetailDataForRecoveryDatasource {
  final ApiClient _apiClient;
  LoanFlowGetCreditDetailDataForRecoveryDatasource (this._apiClient);

  Future<LoanFlowGetCreditDetailDataForRecoveryResponseEntity>loanFlowGetCretidDetDatForRecovery(
    String? vToken,
    String? idLoanCredit,
    String? idSavingAccount,

  )async{
    final response = await _apiClient.post(
      'Mobile/LoanFlowGetCreditDetailDataForRecovery',
    data:{
      "IdLoanCredit" : idLoanCredit ,
      "IdSavingAccount": idSavingAccount
    },
    headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'obtain detail credit to pay',
    );
    return LoanFlowGetCreditDetailDataForRecoveryResponseModel.fromJson(response);
  }
}
