import 'dart:convert';
import '../../domain/entities/entity.dart';

InitialChargeBankGuaranteeResponseModel
initialChargeBankGuaranteeResponseFromJson(String str) =>
    InitialChargeBankGuaranteeResponseModel.fromJson(json.decode(str));

class InitialChargeBankGuaranteeResponseModel
    extends InitialChargeBankGuaranteeResponseEntity {
  InitialChargeBankGuaranteeResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory InitialChargeBankGuaranteeResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => InitialChargeBankGuaranteeResponseModel(
    data: InitialChargeBankGuaranteeModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class InitialChargeBankGuaranteeModel extends InitialChargeBankGuaranteeEntity {
  InitialChargeBankGuaranteeModel({
    required super.colBankGuaranteeType,
    required super.colBeneficiary,
    required super.colBankGuarantee,
  });

  factory InitialChargeBankGuaranteeModel.fromJson(Map<String, dynamic> json) =>
      InitialChargeBankGuaranteeModel(
        colBankGuaranteeType: List<ColBModel>.from(
          json["colBankGuaranteeType"].map((x) => ColBModel.fromJson(x)),
        ),
        colBeneficiary: List<ColBModel>.from(
          json["colBeneficiary"].map((x) => ColBModel.fromJson(x)),
        ),
        colBankGuarantee: List<ColBModel>.from(
          json["colBankGuarantee"].map((x) => ColBModel.fromJson(x)),
        ),
      );
}

class ColBModel extends ColBEntity {
  ColBModel({
    required super.idClasificador,
    required super.nombre,
    required super.codigo,
  });

  factory ColBModel.fromJson(Map<String, dynamic> json) => ColBModel(
    idClasificador: json["idClasificador"],
    nombre: json["nombre"],
    codigo: json["codigo"] ?? '',
  );
}

///Money
GetMoneyByAccountResponseModel getMoneyByAccountResponseFromJson(String str) =>
    GetMoneyByAccountResponseModel.fromJson(json.decode(str));

class GetMoneyByAccountResponseModel extends GetMoneyByAccountResponseEntity {
  GetMoneyByAccountResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });
  factory GetMoneyByAccountResponseModel.fromJson(Map<String, dynamic> json) =>
      GetMoneyByAccountResponseModel(
        data: List<GetMoneyByAccountModel>.from(
          json["data"].map((x) => GetMoneyByAccountModel.fromJson(x)),
        ),
        state: json["state"],
        message: json["message"],
      );
}

class GetMoneyByAccountModel extends GetMoneyByAccountEntity {
  GetMoneyByAccountModel({
    required super.idClasificador,
    required super.code,
    required super.nombre,
  });

  factory GetMoneyByAccountModel.fromJson(Map<String, dynamic> json) =>
      GetMoneyByAccountModel(
        idClasificador: json["idClasificador"],
        code: json["code"],
        nombre: json["nombre"],
      );
}

//GetBankGuaranteeClass
GetBankGuaranteeClassResponseModel getBankGuaranteeClassResponseFromJson(
  String str,
) => GetBankGuaranteeClassResponseModel.fromJson(json.decode(str));

class GetBankGuaranteeClassResponseModel
    extends GetBankGuaranteeClassResponseEntity {
  GetBankGuaranteeClassResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetBankGuaranteeClassResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetBankGuaranteeClassResponseModel(
    data: List<GetBankGuaranteeClassModel>.from(
      json["data"].map((x) => GetBankGuaranteeClassModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class GetBankGuaranteeClassModel extends GetBankGuaranteeClassEntity {
  GetBankGuaranteeClassModel({
    required super.idClasificador,
    required super.nombre,
    required super.codigo,
  });

  factory GetBankGuaranteeClassModel.fromJson(Map<String, dynamic> json) =>
      GetBankGuaranteeClassModel(
        idClasificador: json["idClasificador"],
        nombre: json["nombre"],
        codigo: json["codigo"],
      );
}
