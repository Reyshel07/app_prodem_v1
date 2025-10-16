import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class ProdemExpressSaveSolicitationDatasource {
  final ApiClient _apiClient;
  ProdemExpressSaveSolicitationDatasource(this._apiClient);

  Future<ProdemExpressSaveSolicitationResponseEntity>
  prodemExpressSaveSolicitation(
    String? vToken,
    String idSMSOperation,
    String prodemKeyCode,
    String codeSavingAccountSource,
    String amountTransaction,
    String idMoney,
    String idPerson,
    String beneficiaryDI,
    String beneficiaryName,
    String beneficiaryCellphone,
    String reasonSolicitation,
    String isNaturalClient,
    String idUser,
    String iMEI,
    String location,
    String ipAddress,
  ) async {
    final response = await _apiClient.post(
      'Mobile/ProdemExpressSaveSolicitation',
      operationName: 'service that records the lightning jiro',
      data: {
        "CodeSavingAccountSource": "108-2-1-06681-7",
        "AmountTransaction": "100",
        "IdMoney": "1",
        "IdPerson": "11175880244776760",
        "BeneficiaryDI": "11223344LP",
        "BeneficiaryName": "fgdfgdf",
        "BeneficiaryCellphone": "62537906",
        "ReasonSolicitation": "dsfsdf",
        "IsNaturalClient": true,
        "IdUser": "350921",
        "IMEI": "54456456456",
        "location": "",
        "IpAddress": "",
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
    );
    return ProdemExpressSaveSolicitationResponseModel.fromJson(response);
  }
}
