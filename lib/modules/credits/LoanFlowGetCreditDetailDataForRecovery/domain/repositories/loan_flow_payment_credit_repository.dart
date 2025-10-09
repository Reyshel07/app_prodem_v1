import 'package:app_prodem_v1/modules/transfer_between_accounts/savings_account_transfer_mobile/domain/entities/saving_account_transfer_mobile_entity.dart';

abstract class LoanFlowPaymentCreditRepository {
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
  );
}
