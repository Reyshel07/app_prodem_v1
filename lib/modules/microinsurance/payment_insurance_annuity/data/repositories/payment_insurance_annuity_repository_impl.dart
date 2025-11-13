import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/data/datasource/payment_insurance_annuity_datasouerce.dart';
import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/domain/entities/payment_insurance_annuity_entity.dart';
import 'package:app_prodem_v1/modules/microinsurance/payment_insurance_annuity/domain/repositories/payment_insurance_annuity_repository.dart';

class PaymentInsuranceAnnuityRepositoryImpl
    extends PaymentInsuranceAnnuityRepository {
  PaymentInsuranceAnnuityDatasouerce datasouerce;
  PaymentInsuranceAnnuityRepositoryImpl({required this.datasouerce});

  @override
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
  ) async {
    return await datasouerce.paymentInsuranceAnnuity(
      idInsuranceAnnuity,
      idWebPersonClient,
      idSavingAccount,
      deviceIMEI,
      idUser,
      location,
      ipAddress,
      isOwnInsurance,
      vToken,
      idSMSOperation,
      prodemKeyCode,
    );
  }
}
