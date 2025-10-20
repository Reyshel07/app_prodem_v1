import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/data/models/loan_flow_get_credit_detail_data_for_recovery_by_code_model.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecoveryByCode/domain/entities/loan_flow_get_credit_detail_data_for_recovery_by_code_entity.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/data/models/saving_account_transfer_mobile_model.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';

class LoanFlowGetCreditDetailDataForRecoveryByCodeDatasource {
  final ApiClient _apiClient;
  LoanFlowGetCreditDetailDataForRecoveryByCodeDatasource(this._apiClient);

  Future<LoanFlowGetCreditDetailDataForRecoveryByCodeResponseEntity>
  loanFlowGetCretidDetDatForRecByCode(
    String? vToken,
    String? loanCreditCode,
    String? idSavingAccount,
  ) async {
    final response = await _apiClient.post(
      AppStrings.loanFlowGetCreditDetailDataForRecoveryByCode,
      data: {
        "LoanCreditCode": loanCreditCode,
        "IdSavingAccount": idSavingAccount,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'obtain detail credit by code to pay',
    );
    return LoanFlowGetCreditDetailDataForRecoveryByCodeResponseModel.fromJson(
      response,
    );
  }

  Future<SavingsAccountTransferMobileResponseEntity> loanFlowPayCreditThird(
    String? vToken,
    int idLoanCredit,
    double debitAmount,
    double amountToPay,
    double taxAmount,
    int idLoanCurrency,
    bool withInsuranceReturn,
    int idSavingAccount,
    String loanCreditCode,
    int idCustomer,
    String codeAuthentication,
    bool isNaturalCustomer,
    String idPerson,
    String idUser,
    String imei,
    String location,
    String ipAddress,
    bool isOwnCredit,
    String customerId,
    String customerName,
    //prodemkey
    String? idSMSOperation,
    String? prodemKeyCode,
  ) async {
    final response = await _apiClient.post(
      'verifi',
      data: {
        "IdLoanCredit": idLoanCredit, //IdLoanCredit
        "DebitAmount": debitAmount, //TotalToDebit
        "AmountToPay": amountToPay, //TotalAmountToPay
        "TaxAmount": taxAmount, // totalTax
        "IdLoanCurrency": idLoanCurrency, //IdLoanCurrency
        "WithInsuranceReturn": withInsuranceReturn, //
        "IdSavingAccount": idSavingAccount, // selectedAccount IdOperationEntity
        "LoanCreditCode": loanCreditCode, //LoanCreditCode
        "IdCustomer":
            idCustomer, //idperson val idPerson = if (objUserSession.IsPersonNatural) objUserSession.IdPerson else objUserSession.IdWebClient
        "CodeAuthentication": codeAuthentication, //vacio
        "IsNaturalCustomer": isNaturalCustomer, //scar de la sesion
        "IdPerson": idPerson, //sacar ipperson sesion
        "IdUser": idUser, //sacar iduser de la sesion
        "Imei": imei, //sacar imei dispositivo
        "Location": location, //agarrar ubicacion
        "IpAddress": ipAddress, // agarrar ip
        "IsOwnCredit": isOwnCredit, //true
        "CustomerId": customerId, //vacio
        "CustomerName": customerName, //vacio
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
      operationName: 'pay credit and obtein report',
    );
    return SavingsAccountTransferMobileResponse.fromJson(response);
  }
}
