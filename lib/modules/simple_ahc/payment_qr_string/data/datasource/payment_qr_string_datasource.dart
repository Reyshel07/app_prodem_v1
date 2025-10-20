import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/data/models/payment_qr_string_model.dart';
import '../../domain/entities/entity.dart';

class PaymentQrStringDatasource {
  final ApiClient _apiClient;
  PaymentQrStringDatasource(this._apiClient);

  Future<PaymentQrStringResponseEntity> paymentQrString(
    String codeQr,
    String receiverName,
    String receiverIdentityCardNumber,
    String bankCode,
    String codeAccountDestiny,
    String codeMoney,
    String amount,
    bool isSingleUse,
    String expirationDate,
    String codeService,
    String reference,
    String stringQr,
    String codePaymentAccount,
    String idPerson,
    String idWebClient,
    String ipAddress,
    String idUser,
    String location,
    String imei,
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  ) async {
    final response = await _apiClient.post(
      AppStrings.paymentQrString,
      operationName: 'payment confirmation via QR code',
      data: {
        "CodeQr": codeQr,
        "ReceiverName": receiverName,
        "ReceiverIdentityCardNumber": receiverIdentityCardNumber,
        "BankCode": bankCode,
        "CodeAccountDestiny": codeAccountDestiny,
        "CodeMoney": codeMoney,
        "Amount": amount,
        "IsSingleUse": isSingleUse,
        "ExpirationDate": expirationDate,
        "CodeService": codeService,
        "Reference": reference,
        "stringQr": stringQr,
        "CodePaymentAccount": codePaymentAccount,
        "IdPerson": idPerson,
        "IdWebClient": idWebClient,
        "IpAddress": ipAddress,
        "IdUser": idUser,
        "Location": location,
        "Imei": imei,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
    );
    return PaymentQrStringResponseModel.fromJson(response);
  }
}
