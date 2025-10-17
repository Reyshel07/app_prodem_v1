import 'package:app_prodem_v1/modules/ATM/validate_qr_from_prodem_movil/domain/entities/validate_qr_from_prodem_entity.dart';

import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class ValidateQrFromProdemMovilRepositoryImpl
    extends ValidateQrFromProdemMovilRepository {
  ValidateQrFromProdemMovilDatasource datasource;
  ValidateQrFromProdemMovilRepositoryImpl({required this.datasource});

  @override
  Future<ValidateQrFromProdemMovilResponseEntity> validateQrFromProdemMovil(
    String? vToken,
    String idWebClient,
    String qrCode,
  ) async {
    return await datasource.validateQrFromProdemMovil(
      vToken,
      idWebClient,
      qrCode,
    );
  }
}
