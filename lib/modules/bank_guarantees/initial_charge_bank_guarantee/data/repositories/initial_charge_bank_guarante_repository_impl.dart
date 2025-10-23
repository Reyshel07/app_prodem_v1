import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/data/datasource/initial_charge_bank_guarante_datasource.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/domain/entities/initial_charge_bank_guarante_entity.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/domain/repositories/initial_charge_bank_guarante_repository.dart';

class InitialChargeBankGuaranteRepositoryImpl
    extends InitialChargeBankGuaranteRepository {
  InitialChargeBankGuaranteDatasource datasource;
  InitialChargeBankGuaranteRepositoryImpl({required this.datasource});

  @override
  Future<InitialChargeBankGuaranteeResponseEntity> initialChargeBankGuarantee(
    String? vToken,
  ) async {
    return await datasource.initialChargeBankGuarantee(vToken);
  }
}
