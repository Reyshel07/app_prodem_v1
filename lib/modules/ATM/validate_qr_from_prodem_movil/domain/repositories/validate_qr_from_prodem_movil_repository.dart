import '../entities/entity.dart';

abstract class ValidateQrFromProdemMovilRepository {
  Future<ValidateQrFromProdemMovilResponseEntity> validateQrFromProdemMovil(
    String? vToken,
    String idWebClient,
    String qrCode,
  );
}
