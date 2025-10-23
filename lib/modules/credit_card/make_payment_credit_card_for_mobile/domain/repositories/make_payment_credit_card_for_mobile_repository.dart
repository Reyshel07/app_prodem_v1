import '../entities/entity.dart';

abstract class MakePaymentCreditCardForMobileRepository {
  Future<MakePaymentCreditCardForMobileResponseEntity>
  makePaymentCreditCardForMobile(
    String idCreditLineInstance,
    String idSavingAccount,
    String amountPayment,
    String idLoanCurrency,
    String idSavingAccountMoney,
    String codeAuthentication,
    String idPersonLogged,
    bool isNaturalPerson,
    String creditCardAccountNumber,
    String customerName,
    String idPerson,
    String idUser,
    String imei,
    String location,
    String ipAddress,
    bool isOwnCreditCard,
    String? vToken,
    String? idSMSOperation,
    String? prodemKeyCode,
  );
}
