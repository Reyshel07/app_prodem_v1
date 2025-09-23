import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class SavingAccountDatasource {
  final ApiClient _apiClient;
  SavingAccountDatasource(this._apiClient);
  Future<GetSavingAccountDataResponseEntity> savingAccountData(
    String codeSavingAccountSource,
    String codeSavingAccount,
    int idMoneyOperation,
    String amountOperation,
    String idPerson,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetSavingAccountData',
      data: {
        "CodeSavingAccountSource": codeSavingAccountSource, //"117-2-1-17512-5",
        "CodeSavingAccount": codeSavingAccount, //"117-2-1-17513-0",
        "IdMoneyOperation": idMoneyOperation, //1,
        "AmountOperation": amountOperation, //100,
        "IdPerson": idPerson,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'transfer fees',
    );
    return GetSavingAccountDataResponseModel.fromJson(response);
  }
}
