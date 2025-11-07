import '../entities/entity.dart';

abstract class VerificaPlazoRenovacionRepository {
  Future<VerificaPlazoRenovacionResponseEntity> verificaPlazoRenovacion(
    String idDpfOffice,
    String termInDays,
    String? vToken,
  );
}
