import '../entities/entity.dart';

abstract class InsertWebReferencesRepository {
  Future<InsertWebReferencesResponseEntity> insertWebReferences(
    String idWebReferences,
    String fullName,
    String identityCardNumber,
    String cellPhoneNumber,
    String kinship,
    String idcProduct,
    String productName,
    String idMoney,
    String shortName,
    String ammount,
    String idWebPersonClientRegister,
    String processDate,
    bool isActive,
    String? vToken,
  );
}
