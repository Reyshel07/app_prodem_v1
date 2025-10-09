import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/domain/entities/entity.dart';

abstract class DecryptQrStringRepository {
  Future<DecryptQrStringResponseEntity> decriptQRString(
    String qrString,
    String? vToken,
  );
}
