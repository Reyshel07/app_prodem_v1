import '../entities/entity.dart';

abstract class PaymentQrStringRepository {
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
  );
}
