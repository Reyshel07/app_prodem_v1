import '../entities/entity.dart';

abstract class ProdemExpressDataRepository {
  Future<GetProdemExpressDataResponseEntity> expressData(
    String codeSavingAccountSource,
    String amountTransaction,
    String idMoney,
    String idPErson,
    String benificiaryDi,
    String? vToken,
  );
}
