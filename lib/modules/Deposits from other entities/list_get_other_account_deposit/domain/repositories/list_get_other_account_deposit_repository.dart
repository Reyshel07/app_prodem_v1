import '../entities/entity.dart';

abstract class ListGetOtherAccountDepositRepository {
  Future<ListGetOtherAccountDepositResponseEntity> listGetOtherAccountDeposit(
    String? vToken,
    String idPerson,
  );
}
