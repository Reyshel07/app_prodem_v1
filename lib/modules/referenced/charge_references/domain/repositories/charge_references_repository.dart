import '../entities/entity.dart';

abstract class ChargeReferencesRepository {
  Future<ChargeReferencesResponseEntity> chargeReferences(
    String idWebPersonClient,
    String? vToken,
  );
}
