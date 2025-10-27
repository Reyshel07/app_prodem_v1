import '../entities/entity.dart';

abstract class SintesisGetSearchParametersByModuleRepository {
  Future<SintesisGetSearchParametersByModuleResponseEntity>
  sintesisGetSearchParametersByModule(
    String externalModule,
    String searchCriteria,
    List<dynamic> searchParameter,
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
