import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/data/datasource/payment_qr_string_datasource.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/domain/entities/payment_qr_string_entity.dart';
import 'package:app_prodem_v1/modules/simple_ahc/payment_qr_string/domain/repositories/payment_qr_string_repository.dart';

class PaymentQrStringtRepositoryImpl extends PaymentQrStringRepository {
  PaymentQrStringDatasource datasource;
  PaymentQrStringtRepositoryImpl({required this.datasource});

  @override
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
    return await datasource.paymentQrString(
      codeQr,
      receiverName,
      receiverIdentityCardNumber,
      bankCode,
      codeAccountDestiny,
      codeMoney,
      amount,
      isSingleUse,
      expirationDate,
      codeService,
      reference,
      stringQr,
      codePaymentAccount,
      idPerson,
      idWebClient,
      ipAddress,
      idUser,
      location,
      imei,
      vToken,
    );
  }
}
