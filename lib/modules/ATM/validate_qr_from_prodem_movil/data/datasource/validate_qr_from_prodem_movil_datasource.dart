import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class ValidateQrFromProdemMovilDatasource {
  final ApiClient _apiClient;
  ValidateQrFromProdemMovilDatasource(this._apiClient);

  Future<ValidateQrFromProdemMovilResponseEntity> validateQrFromProdemMovil(
    String? vToken,
    String idWebClient,
    String qrCode,
  ) async {
    final response = await _apiClient.post(
      'Mobile/ValidateQRFromProdemMovil',
      operationName: 'service that validates the QR code provided by the ATM',
      data: {"IdWebClient": idWebClient, "QrCode": qrCode},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return ValidateQrFromProdemMovilResponseModel.fromJson(response);
  }
}
