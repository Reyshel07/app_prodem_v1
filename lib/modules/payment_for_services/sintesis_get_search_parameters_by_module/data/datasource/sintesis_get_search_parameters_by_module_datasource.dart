import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/data/models/sintesis_get_search_parameters_by_module_model.dart';
import '../../domain/entities/entity.dart';

class SintesisGetSearchParametersByModuleDatasource {
  final ApiClient _apiClient;
  SintesisGetSearchParametersByModuleDatasource(this._apiClient);

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
    final response = await _apiClient.post(
      AppStrings.sintesisGetSearchParametersByModule,
      operationName: 'initial service for payment of services',
      data: {
        "externalModule": externalModule,
        "searchCriteria": searchCriteria,
        "searchParameter": searchParameter,
        "OriginType": originType,
        "IsMobileAPP": isMobileAPP,
        "IdUser": idUser,
        "IdOffice": idOffice,
        "IdWebClient": idWebClient,
        "IdCAI": idCAI,
        "IsFavorite": isFavorite,
        "FavoriteName": favoriteName,
        "ExternalModuleReference": externalModuleReference,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return SintesisGetSearchParametersByModuleResponseModel.fromJson(response);
  }
}
