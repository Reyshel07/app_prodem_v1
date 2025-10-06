import 'package:app_prodem_v1/core/networking/http_services.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class CreateDpfSolicitationInternalDatasource {
  final ApiClient _apiClient;
  CreateDpfSolicitationInternalDatasource(this._apiClient);

  Future<CreateDpfSolicitationInternalResponseEntity>createDpfSoliciInternal(
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


  )async{
    final response = await _apiClient.post(
      'Mobile/CreateDPFSolicitationInternal',
      data:
        {
    "PhoneNumber": "72584788",
    "ContextData": "",
    "IdentityCardNumber": "5968439",
    "Location": "context",
    "InteresUpdate": 0,
    "Amount": "1000",
    "AmountFinalUpdate": "49.56",
    "TermUpdate": "367",
    "RateUpdate": "8.5",
    "Email": "kjsdkjdns@gmail.com",
    "Names": "jade piza",
    "Term": "365",
    "IdOfficeDPF": 17,
    "DebitAccountCode": "117-2-1-17491-5",
    "IdPerson": "17000000000003984",
    "IpNumber": "",
    "IdAccount": "17098064656442366",
    "IdUser": "350880",
    "IdWebPerson": "1129150143954615",
    "IsEmployee": true
},
headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
      operationName: 'create final dpf',
      
    );
    return CreateDpfSolicitationInternalResponseModel.fromJson(response);

  }
}