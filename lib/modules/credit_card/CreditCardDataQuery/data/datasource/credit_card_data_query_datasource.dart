
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/data/models/credit_card_data_query_model.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/domain/entities/credit_card_data_query_entity.dart';

class CreditCardDataQueryDatasource {
  final ApiClient _apiClient;
  CreditCardDataQueryDatasource(this._apiClient);

  Future<CreditCardDataQueryResponseEntity>
  creditCardDataQuery(
    String? vToken,
    String? creditCardNumber,
    String? idPerson,
    String? idUser,
    String? imei,
    String? location,
    String? ipAddress,
  ) async {
    final response = await _apiClient.post(
      'Mobile/CreditCardDataQuery',
      data: {
        "creditCardNumber": creditCardNumber, 
        "IdPerson": idPerson,
        "IdUser": idUser,
        "Imei": imei,
        "Location": location,
        "IpAddress": ipAddress
        },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'obtain detail credit card',
    );
    return CreditCardDataQueryResponseModel.fromJson(
      response,
    );
  }

 
}
