import 'package:app_prodem_v1/modules/credit_card/credit_card_data_for_recovery/domain/entities/credit_car_data_for_recovery_entity.dart';

import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class CreditCarDataForRecoveryRepositoryImpl
    extends CreditCarDataForRecoveryRepository {
  CreditCarDataForRecoveryDatasource datasource;
  CreditCarDataForRecoveryRepositoryImpl({required this.datasource});

  @override
  Future<CreditCardDataForRecoveryResponseEntity> creditCardDataForRecovery(
    String idCreditLineInstance,
    String creditCardNumber,
    String codeSavingAccountSource,
    String amountOperation,
    int idMoneyOperation,
    String? vToken,
  ) async {
    return await datasource.creditCardDataForRecovery(
      idCreditLineInstance,
      creditCardNumber,
      codeSavingAccountSource,
      amountOperation,
      idMoneyOperation,
      vToken,
    );
  }
}
