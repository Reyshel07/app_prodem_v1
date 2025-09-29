import '../entities/entity.dart';

abstract class PrExpressSolicitationWebRepository {
  Future<GetProdemExpressSolicitationWebResponseEntity> prExpressSoliWeb(
    String idPerson,
    String? vToken,
    List<String> colCodeSavingsAccounts,
  );
}
