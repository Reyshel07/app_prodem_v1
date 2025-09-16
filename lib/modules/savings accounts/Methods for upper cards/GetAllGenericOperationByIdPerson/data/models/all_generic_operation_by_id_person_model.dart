import 'dart:convert';
import '../../domain/entities/entity.dart';

GetAllGenericOperationByIdPersonResponseModel
getAllGenericOperationByIdPersonResponseFromJson(String str) =>
    GetAllGenericOperationByIdPersonResponseModel.fromJson(json.decode(str));

class GetAllGenericOperationByIdPersonResponseModel
    extends GetAllGenericOperationByIdPersonResponseEntity {
  GetAllGenericOperationByIdPersonResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetAllGenericOperationByIdPersonResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetAllGenericOperationByIdPersonResponseModel(
    data: DataAllGenericOperationByIdPersonModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class DataAllGenericOperationByIdPersonModel
    extends DataAllGenericOperationByIdPersonEntity {
  DataAllGenericOperationByIdPersonModel({
    required super.colAccounts,
    required super.colDpfs,
    required super.colCredits,
    required super.colCreditCards,
    required super.resultCode,
    required super.errorMessage,
    required super.reportString,
  });

  factory DataAllGenericOperationByIdPersonModel.fromJson(
    Map<String, dynamic> json,
  ) => DataAllGenericOperationByIdPersonModel(
    colAccounts: List<ColModel>.from(
      json["colAccounts"].map((x) => ColModel.fromJson(x)),
    ),
    colDpfs: List<dynamic>.from(json["colDpfs"].map((x) => x)),
    colCredits: List<ColModel>.from(
      json["colCredits"].map((x) => ColModel.fromJson(x)),
    ),
    colCreditCards: List<ColModel>.from(
      json["colCreditCards"].map((x) => ColModel.fromJson(x)),
    ),
    resultCode: json["resultCode"],
    errorMessage: json["errorMessage"],
    reportString: json["reportString"],
  );
}

class ColModel extends ColEntity {
  ColModel({
    required super.codeOperation,
    required super.stateOperation,
    required super.balance,
    required super.specialBehavior,
  });

  factory ColModel.fromJson(Map<String, dynamic> json) => ColModel(
    codeOperation: json["codeOperation"],
    stateOperation: json["stateOperation"],
    balance: json["balance"],
    specialBehavior: json["specialBehavior"],
  );
}
