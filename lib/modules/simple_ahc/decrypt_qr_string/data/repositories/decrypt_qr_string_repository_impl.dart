import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/data/datasource/decrypt_qr_string_datasource.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/domain/entities/decrypt_qr_string_entity.dart';
import 'package:app_prodem_v1/modules/simple_ahc/decrypt_qr_string/domain/repositories/decrypt_qr_string_repository.dart';

class DecryptQrStringRepositoryImpl extends DecryptQrStringRepository {
  DecryptQrStringDatasource datasource;
  DecryptQrStringRepositoryImpl({required this.datasource});

  @override
  Future<DecryptQrStringResponseEntity> decriptQRString(
    String qrString,
    String? vToken,
  ) async {
    return await datasource.decryptQrString(qrString, vToken);
  }
}
