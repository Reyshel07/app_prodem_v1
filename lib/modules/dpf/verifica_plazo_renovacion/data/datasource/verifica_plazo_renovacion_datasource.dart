import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';

import '../../domain/entities/entity.dart';
import '../models/model.dart';

class VerificaPlazoRenovacionDatasource {
  final ApiClient _apiClient;
  VerificaPlazoRenovacionDatasource(this._apiClient);

  Future<VerificaPlazoRenovacionResponseEntity> verificaPlazoRenovacion(
    String idDpfOffice,
    String termInDays,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.verificaPlazoRenovacion,
      operationName:
          'service that validates the date for cancellation and renewal',
      data: {"IdDpfOffice": idDpfOffice, "TermInDays": termInDays},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return VerificaPlazoRenovacionResponseModel.fromJson(response);
  }

  Future<VerifyRedeemResponseEntity> verifyRedeem(
    String term,
    String? vToken,
  ) async {
    final response = await _apiClient.post(
      AppStrings.verifyRedeem,
      operationName: 'service that sends a confirmation message',
      data: {"Term": term},
      headers: {
        'Authorization': 'Bearer $vToken',
        'Content-Type': 'application/json',
      },
    );
    return VerifyRedeemResponseModel.fromJson(response);
  }

  Future<ValidateAndSaveRenovationDpfResponseEntity>
  validateAndSaveRenovationDpf(
    String idRenovationDPF,
    String idcDPFMFInitial,
    String idcDPFMFNew,
    String idcOperationType,
    String cellPhone,
    String email,
    String idDpfOffice,
    String idPersonWeb,
    String amount,
    String termInDays,
    String rate,
    String interestEarned,
    String finalAmount,
    String originResources,
    String idcState,
    String geographicLocation,
    String contextData,
    String iP,
    String solicitationDate,
    String idMoney,
    String fullName,
    String idSavingsAccount,
    String codeSMS,
    String idUser,
    bool withProdemKey,
    bool isDpfEmployee,
    String codeSavingAccount,
    String idPerson,
    String idcOperationTypeAUX,
    String idcInfoType,
    bool isAnotherAccount,
    String amountOnAccount,
    String oldAmount,
    String interestAmountOld,
    String capitalRenew,
    String renewalTax,
    String closingTax,
    String idDepositProduct,
    String depositProduct,
    String hashTracking,
    bool isPignorado,
    String? vToken,
    String? idSMSOperation,
    String? prodemKeyCode,
  ) async {
    final response = await _apiClient.post(
      AppStrings.validateAndSaveRenovationDpf,
      operationName:
          'service that performs the final recording of the dpf to cancel and renew ',
      data: {
        /*"IdRenovationDPF": idRenovationDPF,
        "IdcDPFMFInitial": idcDPFMFInitial,
        "IdcDPFMFNew": idcDPFMFNew,
        "IdcOperationType": idcOperationType,
        "CellPhone": cellPhone,
        "Email": email,
        "IdDpfOffice": idDpfOffice,
        "IdPersonWeb": idPersonWeb,
        "Amount": amount,
        "TermInDays": termInDays,
        "Rate": rate,
        "InterestEarned": interestEarned,
        "FinalAmount": finalAmount,
        "OriginResources": originResources,
        "IdcState": idcState,
        "GeographicLocation": geographicLocation,
        "ContextData": contextData,
        "IP": iP,
        "SolicitationDate": solicitationDate,
        "IdMoney": idMoney,
        "FullName": fullName,
        "IdSavingsAccount": idSavingsAccount,
        "CodeSMS": codeSMS,
        "IdUser": idUser,
        "WithProdemKey": withProdemKey,
        "IsDpfEmployee": isDpfEmployee,
        "CodeSavingAccount": codeSavingAccount,
        "IdPerson": idPerson,
        "IdcOperationTypeAUX": idcOperationTypeAUX,
        "IdcInfoType": idcInfoType,
        "IsAnotherAccount": isAnotherAccount,
        "AmountOnAccount": amountOnAccount,
        "OldAmount": oldAmount,
        "InterestAmountOld": interestAmountOld,
        "CapitalRenew": capitalRenew,
        "RenewalTax": 0.0,
        "ClosingTax": closingTax,
        "IdDepositProduct": idDepositProduct,
        "DepositProduct": depositProduct,
        "HashTracking": hashTracking,
        "IsPignorado": isPignorado,*/
        "IdRenovationDPF": 0,
        "IdcDPFMFInitial": 63103875881064441,
        "IdcDPFMFNew": 0,
        "IdcOperationType": 600085,
        "CellPhone": "70521850",
        "Email": "Xsusimeavebustillo@gmail.comX",
        "IdDpfOffice": 63,
        "IdPersonWeb": 17112305188548676,
        "Amount": 64774.0,
        "TermInDays": 0,
        "Rate": 0.0,
        "InterestEarned": 0.0,
        "FinalAmount": 64774.0,
        "OriginResources": "",
        "IdcState": 0,
        "GeographicLocation":
            "{\"adminArea\":\"Departamento de La Paz\",\"country\":\"Bolivia\",\"featureName\":\"FVQC+MXQ\",\"latitude\":\"-16.5109404\",\"locality\":\"La Paz\",\"longitude\":\"-68.1276197\",\"subAdminArea\":\"Murillo\",\"subLocality\":\"Macrodistrito Cotahuma\",\"thoroughfare\":\"Belisario Salinas\"}",
        "ContextData": "",
        "IP": "0.0.0.0",
        "SolicitationDate": "2025-11-10T12:08:04-04:00",
        "IdMoney": 1,
        "FullName": "ROBLES VISCARRA SANDRO SIXTO",
        "IdSavingsAccount": "17151629734483090",
        "CodeSMS": "725966",
        "IdUser": 350923,
        "WithProdemKey": true,
        "IsDpfEmployee": false,
        "CodeSavingAccount": "117-2-1-17506-8",
        "IdPerson": 17303255029099749,
        "IdcOperationTypeAUX": 89,
        "IdcInfoType": 0,
        "IsAnotherAccount": false,
        "AmountOnAccount": 64774.0,
        "OldAmount": 60000.0,
        "InterestAmountOld": 4774.0,
        "CapitalRenew": 64774.0,
        "RenewalTax": 0.0,
        "ClosingTax": 0.0,
        "IdDepositProduct": 1,
        "DepositProduct": "",
        "HashTracking": "11e42132-e1e0-4b2d-a384-a6ac8a8ecad1",
        "IsPignorado": false,
      },
      headers: {
        'Authorization': 'Bearer $vToken',
        'CodeOperation':
            "{'IdSMSOperation': $idSMSOperation,'ProdemKeyCode': '$prodemKeyCode'}",
        'Content-Type': 'application/json',
      },
    );
    return ValidateAndSaveRenovationDpfResponseModel.fromJson(response);
  }
}
