import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class InsuranceGetListRepositoryImpl extends InsuranceGetListRepository {
  InsuranceGetListDatasource datasource;
  InsuranceGetListRepositoryImpl({required this.datasource});

  @override
  Future<InsuranceGetListResponseEntity> insuranceGetList(
    String identityCardNumber,
    String idPerson,
    String? vToken,
  ) async {
    return await datasource.insuranceGetList(
      identityCardNumber,
      idPerson,
      vToken,
    );
  }
}
