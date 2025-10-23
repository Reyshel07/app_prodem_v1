import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class MakePaymentCreditCardForMobileDatasource {
  final ApiClient _apiClient;
  MakePaymentCreditCardForMobileDatasource(this._apiClient);

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
    final response = await _apiClient.post(
      AppStrings.makePaymentCreditCardForMobile,
      operationName: 'Service that completes credit card payment ',
      data: {
        "IdCreditLineInstance": idCreditLineInstance,
        "IdSavingAccount": idSavingAccount,
        "AmountPayment": amountPayment,
        "IdLoanCurrency": idLoanCurrency,
        "IdSavingAccountMoney": idSavingAccountMoney,
        "CodeAuthentication": codeAuthentication,
        "IdPersonLogged": idPersonLogged,
        "IsNaturalPerson": isNaturalPerson,
        "CreditCardAccountNumber": creditCardAccountNumber,
        "CustomerName": customerName,
        "IdPerson": idPerson,
        "IdUser": idUser,
        "Imei": imei,
        "Location": location,
        "IpAddress": ipAddress,
        "IsOwnCreditCard": isOwnCreditCard,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
    );
    return MakePaymentCreditCardForMobileResponse.fromJson(response);
  }
}
