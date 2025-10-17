import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class CreateDpfSolicitationInternalDatasource {
  final ApiClient _apiClient;
  CreateDpfSolicitationInternalDatasource(this._apiClient);

  Future<CreateDpfSolicitationInternalResponseEntity> createDpfSoliciInternal(
    String? vToken,
    String phoneNumber,
    String contextData,
    String identityCardNumber,
    String location,
    String interesUpdate,
    String amount,
    String amountFinalUpdate,
    String termUpdate,
    String rateUpdate,
    String email,
    String names,
    String term,
    String idOfficeDPF,
    String debitAccountCode,
    String idPerson,
    String ipNumber,
    String idAccount,
    String idUser,
    String idWebPerson,
    bool isEmployee,
    String idSMSOperation,
    String prodemKeyCode,
  ) async {
    final response = await _apiClient.post(
      'Mobile/CreateDPFSolicitationInternal',
      data: {
        "PhoneNumber": phoneNumber,
        "ContextData": contextData,
        "IdentityCardNumber": identityCardNumber,
        "Location": location,
        "InteresUpdate": interesUpdate,
        "Amount": amount,
        "AmountFinalUpdate": amountFinalUpdate,
        "TermUpdate": termUpdate,
        "RateUpdate": rateUpdate,
        "Email": email,
        "Names": names,
        "Term": term,
        "IdOfficeDPF": idOfficeDPF,
        "DebitAccountCode": debitAccountCode,
        "IdPerson": idPerson,
        "IpNumber": ipNumber,
        "IdAccount": idAccount,
        "IdUser": idUser,
        "IdWebPerson": idWebPerson,
        "IsEmployee": isEmployee,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
      operationName: 'create final dpf',
    );
    return CreateDpfSolicitationInternalResponseModel.fromJson(response);
  }
}
