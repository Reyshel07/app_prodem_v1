import '../entities/entity.dart';

abstract class InitialChargeBankGuaranteRepository {
  Future<InitialChargeBankGuaranteeResponseEntity> initialChargeBankGuarantee(
    String? vToken,
  );
}
