import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class InsertWebReferencesDatasource {
  final ApiClient _apiClient;
  InsertWebReferencesDatasource(this._apiClient);

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
  ) async {
    final response = await _apiClient.post(
      AppStrings.insertWebReferences,
      operationName: 'service for employees to refer friends, final insertion ',
      data: {
        "IdWebReferences": idWebReferences,
        "FullName": fullName,
        "IdentityCardNumber": identityCardNumber,
        "CellPhoneNumber": cellPhoneNumber,
        "Kinship": kinship,
        "IdcProduct": idcProduct,
        "ProductName": productName,
        "IdMoney": idMoney,
        "ShortName": shortName,
        "Ammount": ammount,
        "IdWebPersonClientRegister": idWebPersonClientRegister,
        "ProcessDate": processDate,
        "IsActive": isActive,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return InsertWebReferencesResponseModel.fromJson(response);
  }
}
