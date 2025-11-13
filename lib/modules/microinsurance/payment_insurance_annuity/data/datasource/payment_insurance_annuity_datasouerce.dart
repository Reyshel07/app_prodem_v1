import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class PaymentInsuranceAnnuityDatasouerce {
  final ApiClient _apiClient;
  PaymentInsuranceAnnuityDatasouerce(this._apiClient);

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
    final response = await _apiClient.post(
      AppStrings.paymentInsuranceAnnuity,
      operationName: 'service that complements secure third-party payment ',
      data: {
        "idInsuranceAnnuity": idInsuranceAnnuity,
        "idWebPersonClient": idWebPersonClient,
        "idSavingAccount": idSavingAccount,
        "DeviceIMEI": deviceIMEI,
        "IdUser": idUser,
        "location": location,
        "IpAddress": ipAddress,
        "IsOwnInsurance": isOwnInsurance,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
    );
    return PaymentInsuranceAnnuityResponseModel.fromJson(response);
  }
}
