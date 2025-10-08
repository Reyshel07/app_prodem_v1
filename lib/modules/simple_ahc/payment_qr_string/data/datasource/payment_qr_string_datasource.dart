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
    String isSingleUse,
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
  ) async {
    final response = await _apiClient.post(
      'Mobile/PaymentQrString',
      operationName: 'payment confirmation via QR code',
      data: {
        "CodeQr": "25100701036000000014",
        "ReceiverName": "henry",
        "ReceiverIdentityCardNumber": "11223344LP",
        "BankCode": "1036",
        "CodeAccountDestiny": "11721174915",
        "CodeMoney": "BOB",
        "Amount": "456",
        "IsSingleUse": false,
        "ExpirationDate": "2035-10-07T00:00:00",
        "CodeService": "81339",
        "Reference": "gastos",
        "stringQr":
            "FrHvyBoggnc923sQ+K3cxjGV5iTN9t5xqG/Tf6dbrf0jRrVoTN02O51qPnm+EQoN546TJ3YVpLomdUYnlnJcdBKNW1+U+2080lHI6+rXezgz9ZExtXENPjgxVjNhsuIR2JQYW/DonjyE4FvhqlIz0GCG5AML/WvRlNjITqobJ4E=|1036",
        "CodePaymentAccount": "117-2-1-17505-4",
        "IdPerson": "17000000000003984",
        "IdWebClient": "1129150143954615",
        "IpAddress": "",
        "IdUser": "350880",
        "Location": "",
        "Imei": "",
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return PaymentQrStringResponseModel.fromJson(response);
  }
}
