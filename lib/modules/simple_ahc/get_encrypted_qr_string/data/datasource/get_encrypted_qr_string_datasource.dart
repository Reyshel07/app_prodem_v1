import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/data/models/get_encrypted_qr_string_model.dart';
import '../../domain/entities/entity.dart';

class GetEncryptedQrStringDatasource {
  final ApiClient _apiClient;
  GetEncryptedQrStringDatasource(this._apiClient);

  Future<GetEncryptedQrStringResponseEntity> getEncryptedQrString(
    String? vToken,
    String idPerson,
    String accountCode,
    String moneyCode,
    String amount,
    bool isUniqueUse,
    String expiredOption,
    String reference,
    String idQuickResponse,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetEncryptedQrString',
      operationName: 'QR',
      data: {
        "idPerson": idPerson,
        "accountCode": accountCode,
        "moneyCode": moneyCode,
        "amount": amount,
        "isUniqueUse": isUniqueUse,
        "expiredOption": expiredOption,
        "reference": reference,
        "IdQuickResponse": idQuickResponse,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetEncryptedQrStringResponseModel.fromJson(response);
  }
}
