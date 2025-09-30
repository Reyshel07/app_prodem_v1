import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class SavingAccountExtracDatasource {
  final ApiClient _apiClient;
  SavingAccountExtracDatasource(this._apiClient);
  Future<SavingsAccountExtractDataTransactionableResponseEntity>
  savingAccountExtrac(
    String codeSavingsAccount,
    String idPerson,
    String idUser,
    String? vToken,
    String location,
    String ip, String imei
  ) async {
    final response = await _apiClient.post(
      'Mobile/SavingsAccountExtractDataTransactionable',
      data: {
        "CodeSavingsAccount": codeSavingsAccount,
        "IdPerson": idPerson,
        "IdUser": idUser,
        "IMEI": imei, 
        "location": location,
        "IpAddress": ip,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },

      operationName: 'latest movements ',
    );
    return SavingsAccountExtractDataTransactionableResponse.fromJson(response);
  }
}
//cajas de ahorro- uñtimos movimientos 