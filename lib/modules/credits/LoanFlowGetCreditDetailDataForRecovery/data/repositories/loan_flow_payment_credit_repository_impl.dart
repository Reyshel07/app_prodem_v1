import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/data/datasource/loan_flow_get_credit_detail_data_for_recovery_datasource.dart';
import 'package:app_prodem_v1/modules/credits/LoanFlowGetCreditDetailDataForRecovery/domain/repositories/loan_flow_payment_credit_repository.dart';
import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';

class LoanFlowPaymentCreditRepositoryImpl extends LoanFlowPaymentCreditRepository {
  LoanFlowGetCreditDetailDataForRecoveryDatasource datasource;
  LoanFlowPaymentCreditRepositoryImpl ({required this.datasource});

   @override
  Future<SavingsAccountTransferMobileResponseEntity> loanFlowPaymentCredit(
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
  ){
    return datasource.loanFlowPayCredit(vToken, idLoanCredit, debitAmount, amountToPay, taxAmount, idLoanCurrency, withInsuranceReturn, idSavingAccount, loanCreditCode, idCustomer, codeAuthentication, isNaturalCustomer, idPerson, idUser, imei, location, ipAddress, isOwnCredit, customerId, customerName, idSMSOperation, prodemKeyCode);
  }
}