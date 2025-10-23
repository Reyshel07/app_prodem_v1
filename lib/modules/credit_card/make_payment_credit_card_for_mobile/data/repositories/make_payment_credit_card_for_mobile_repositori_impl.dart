import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class MakePaymentCreditCardForMobileRepositoriImpl
    extends MakePaymentCreditCardForMobileRepository {
  MakePaymentCreditCardForMobileDatasource datasource;
  MakePaymentCreditCardForMobileRepositoriImpl({required this.datasource});

  @override
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
  ) async {
    return await datasource.makePaymentCreditCardForMobile(
      idCreditLineInstance,
      idSavingAccount,
      amountPayment,
      idLoanCurrency,
      idSavingAccountMoney,
      codeAuthentication,
      idPersonLogged,
      isNaturalPerson,
      creditCardAccountNumber,
      customerName,
      idPerson,
      idUser,
      imei,
      location,
      ipAddress,
      isOwnCreditCard,
      vToken,
      idSMSOperation,
      prodemKeyCode,
    );
  }
}
