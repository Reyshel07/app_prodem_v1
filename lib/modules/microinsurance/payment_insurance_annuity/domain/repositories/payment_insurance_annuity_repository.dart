import '../entities/entity.dart';

abstract class PaymentInsuranceAnnuityRepository {
  Future<PaymentInsuranceAnnuityResponseEntity> paymentInsuranceAnnuity(
    String idInsuranceAnnuity,
    String idWebPersonClient,
    String idSavingAccount,
    String deviceIMEI,
    String idUser,
    String location,
    String ipAddress,
    bool isOwnInsurance,
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
  );
}
