import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/data/datasource/sintesis_get_search_parameters_by_module_datasource.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/domain/entities/sintesis_get_search_parameters_by_module_entity.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/domain/repositories/sintesis_get_search_parameters_by_module_repository.dart';

class SintesisGetSearchParametersByModuleRepositoryImpl
    extends SintesisGetSearchParametersByModuleRepository {
  SintesisGetSearchParametersByModuleDatasource datasource;
  SintesisGetSearchParametersByModuleRepositoryImpl({required this.datasource});

  @override
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
  ) async {
    return await datasource.sintesisGetSearchParametersByModule(
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
