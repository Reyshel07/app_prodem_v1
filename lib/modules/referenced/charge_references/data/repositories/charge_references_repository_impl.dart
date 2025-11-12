import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class ChargeReferencesRepositoryImpl extends ChargeReferencesRepository {
  ChargeReferencesDatasource datasource;
  ChargeReferencesRepositoryImpl({required this.datasource});

  @override
  Future<ChargeReferencesResponseEntity> chargeReferences(
    String idWebPersonClient,
    String? vToken,
  ) async {
    return await datasource.chargeReferences(idWebPersonClient, vToken);
  }
}
