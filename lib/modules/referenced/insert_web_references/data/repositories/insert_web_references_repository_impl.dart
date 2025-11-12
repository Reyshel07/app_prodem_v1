import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class InsertWebReferencesRepositoryImpl extends InsertWebReferencesRepository {
  InsertWebReferencesDatasource datasource;
  InsertWebReferencesRepositoryImpl({required this.datasource});

  @override
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
    String isActive,
    String? vToken,
  ) async {
    return await datasource.insertWebReferences(
      idWebReferences,
      fullName,
      identityCardNumber,
      cellPhoneNumber,
      kinship,
      idcProduct,
      productName,
      idMoney,
      shortName,
      ammount,
      idWebPersonClientRegister,
      processDate,
      isActive,
      vToken,
    );
  }
}
