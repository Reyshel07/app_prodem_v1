import '../entities/entity.dart';

abstract class SintesisObtainOperatingDebtBalanceRepository {
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
  );
}
