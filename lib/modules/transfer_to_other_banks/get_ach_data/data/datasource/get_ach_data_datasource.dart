import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/data/models/get_ach_data_screen.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_data/domain/entities/get_ach_data_entity.dart';

class GetAchDataDatasource {
  final ApiClient _apiClient;
  GetAchDataDatasource(this._apiClient);

  Future<GetAchDataResponseEntity> getAchData(
    String idSavingsAccount,
    String amountTransaction,
    String idMoney,
    String idPerson,
    bool isNaturalClient,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getAchData,
      operationName: 'transfer to other banks intermediary',
      data: {
        "IdSavingsAccount":
            idSavingsAccount, //"17149242834457352", // cuenta destino
        "AmountTransaction": amountTransaction, //"879",
        "IdMoney": idMoney, // "1",
        "IdPerson": idPerson, // "17000000000003984",
        "IsNaturalClient": isNaturalClient,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetAchDataResponseModel.fromJson(response);
  }
}
