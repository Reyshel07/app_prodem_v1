import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/data/models/decrypt_qr_string_model.dart';

import '../../domain/entities/entity.dart';

class DecryptQrStringDatasource {
  final ApiClient _apiClient;
  DecryptQrStringDatasource(this._apiClient);

  Future<DecryptQrStringResponseEntity> decryptQrString(
    String qrString,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.decryptQrString,
      operationName: 'service that decrypts the QR code for payment',
      data: {"QrString": qrString},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return DecryptQrStringResponseModel.fromJson(response);
  }
}
