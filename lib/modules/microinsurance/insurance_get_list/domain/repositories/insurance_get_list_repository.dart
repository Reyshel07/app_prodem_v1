import '../entities/entity.dart';

abstract class InsuranceGetListRepository {
  Future<InsuranceGetListResponseEntity> insuranceGetList(
    String identityCardNumber,
    String idPerson,
    String? vToken,
  );
}
