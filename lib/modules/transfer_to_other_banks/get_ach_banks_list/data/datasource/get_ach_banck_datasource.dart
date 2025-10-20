import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/data/models/get_ach_bank_model.dart';
import 'package:app_prodem_v1/modules/transfer_to_other_banks/get_ach_banks_list/domain/entities/get_ach_banck_entity.dart';

class GetAchBanckDatasource {
  final ApiClient _apiClient;
  GetAchBanckDatasource(this._apiClient);

  Future<GetAchBanksListResponseEntity> getAchBanckList(
    String idUser,
    String accountType,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.getAchBanksList,
      operationName: 'obtains the list of banks',
      data: {
        "IdUser": idUser, //"350880",
        "AccountType": accountType, //"1"
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return GetAchBanksListResponse.fromJson(response);
  }
}
