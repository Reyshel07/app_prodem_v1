import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class ExpressDataDatasource {
  final ApiClient _apiClient;
  ExpressDataDatasource(this._apiClient);
  Future<GetProdemExpressDataResponseEntity> expressData(
    String codeSavingAccountSource,
    String amountTransaction,
    String idMoney,
    String idPErson,
    String benificiaryDi,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      'Mobile/GetProdemExpressData',
      data: {
        "CodeSavingAccountSource": codeSavingAccountSource, //"117-2-1-17512-2",
        "AmountTransaction": amountTransaction, //"100",
        "IdMoney": idMoney, //"1",
        "IdPerson": idPErson, //"0",
        "BeneficiaryDI": benificiaryDi, //"145454",
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'request for a wire transfer',
    );
    return GetProdemExpressDataResponseModel.fromJson(response);
  }
}
