import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class SintesisObtainOperatingDebtBalanceRepositoryImpl
    extends SintesisObtainOperatingDebtBalanceRepository {
  SintesisObtainOperatingDebtBalanceDatasource datasource;
  SintesisObtainOperatingDebtBalanceRepositoryImpl({required this.datasource});

  @override
  Future<SintesisObtainOperatingDebtBalanceResponseEntity>
  sintesisObtainOperatingDebtBalance(
    String externalModule,
    String searchCriteria,
    List<String> searchParameter,
    String originType,
    bool isMobileAPP,
    String idUser,
    String idOffice,
    String idWebClient,
    String idCAI,
    bool isFavorite,
    String favoriteName,
    String externalModuleReference,
    String? vToken,
  ) async {
    return await datasource.sintesisObtainOperatingDebtBalance(
      externalModule,
      searchCriteria,
      searchParameter,
      originType,
      isMobileAPP,
      idUser,
      idOffice,
      idWebClient,
      idCAI,
      isFavorite,
      favoriteName,
      externalModuleReference,
      vToken,
    );
  }
}
