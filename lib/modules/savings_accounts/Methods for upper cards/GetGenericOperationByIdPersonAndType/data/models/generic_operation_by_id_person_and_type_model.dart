import 'dart:convert';
import '../../domain/entities/entity.dart';

GetGenericOperationByIdPersonAndTypeResponseModel
getGenericOperationByIdPersonAndTypeResponseFromJson(String str) =>
    GetGenericOperationByIdPersonAndTypeResponseModel.fromJson(
      json.decode(str),
    );

class GetGenericOperationByIdPersonAndTypeResponseModel
    extends GetGenericOperationByIdPersonAndTypeResponseEntity {
  GetGenericOperationByIdPersonAndTypeResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetGenericOperationByIdPersonAndTypeResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetGenericOperationByIdPersonAndTypeResponseModel(
    data: DataGenericOperationBiIdPersonAndTypeModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class DataGenericOperationBiIdPersonAndTypeModel
    extends DataGenericOperationByIdPersonAndTypeEntity {
  DataGenericOperationBiIdPersonAndTypeModel({
    required super.colOperations,
    required super.colAccounts,
    required super.resultCode,
    required super.errorMessage,
    required super.reportString,
  });

  factory DataGenericOperationBiIdPersonAndTypeModel.fromJson(
    Map<String, dynamic> json,
  ) => DataGenericOperationBiIdPersonAndTypeModel(
    colOperations: List<ColOperationModel>.from(
      json["colOperations"].map((x) => ColOperationModel.fromJson(x)),
    ),
    colAccounts: List<ColAccountModel>.from(
      json["colAccounts"].map((x) => ColAccountModel.fromJson(x)),
    ),
    resultCode: json["resultCode"],
    errorMessage: json["errorMessage"],
    reportString: json["reportString"],
  );
}

class ColAccountModel extends ColAccountEntity {
  ColAccountModel({
    required super.idMoney,
    required super.codMoney,
    required super.idOperationEntity,
    required super.operationCode,
    required super.idOperationOffice,
    required super.availableAmount,
    required super.idcManagementWay,
    required super.managementWay,
    required super.specialBehavior,
    required super.holders,
    required super.selected,
  });

  factory ColAccountModel.fromJson(Map<String, dynamic> json) =>
      ColAccountModel(
        idMoney: json["idMoney"],
        codMoney: json["codMoney"],
        idOperationEntity: json["idOperationEntity"].toDouble(),
        operationCode: json["operationCode"],
        idOperationOffice: json["idOperationOffice"],
        availableAmount: json["availableAmount"].toDouble(),
        idcManagementWay: json["idcManagementWay"],
        managementWay: json["managementWay"],
        specialBehavior: json["specialBehavior"],
        holders: json["holders"],
        selected: json["selected"],
      );
}

class ColOperationModel extends ColOperationEntity {
  ColOperationModel({
    required super.codeOperation,
    required super.stateOperation,
    required super.balance,
    required super.specialBehavior,
  });

  factory ColOperationModel.fromJson(Map<String, dynamic> json) =>
      ColOperationModel(
        codeOperation: json["codeOperation"],
        stateOperation: json["stateOperation"],
        balance: json["balance"],
        specialBehavior: json["specialBehavior"],
      );
}
