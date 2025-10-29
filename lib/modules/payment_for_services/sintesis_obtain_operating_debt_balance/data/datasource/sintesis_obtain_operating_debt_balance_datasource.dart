import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class SintesisObtainOperatingDebtBalanceDatasource {
  final ApiClient _apiClient;
  SintesisObtainOperatingDebtBalanceDatasource(this._apiClient);

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
    final response = await _apiClient.post(
      AppStrings.sintesisObtainOperatingDebtBalance,
      operationName: 'second service for the payment of services',
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
    return SintesisObtainOperatingDebtBalanceResponseModel.fromJson(response);
  }
}
