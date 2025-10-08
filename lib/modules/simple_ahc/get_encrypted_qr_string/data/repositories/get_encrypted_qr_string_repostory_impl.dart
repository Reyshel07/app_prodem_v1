import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/data/datasource/get_encrypted_qr_string_datasource.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/domain/entities/get_encrypted_qr_string_entity.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_encrypted_qr_string/domain/repositories/get_encrypted_qr_string_repository.dart';

class GetEncryptedQrStringRepostoryImpl extends GetEncryptedQrStringRepository {
  final GetEncryptedQrStringDatasource datasource;
  GetEncryptedQrStringRepostoryImpl({required this.datasource});

  @override
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
    return await datasource.getEncryptedQrString(
      vToken,
      idPerson,
      accountCode,
      moneyCode,
      amount,
      isUniqueUse,
      expiredOption,
      reference,
      idQuickResponse,
    );
  }
}
