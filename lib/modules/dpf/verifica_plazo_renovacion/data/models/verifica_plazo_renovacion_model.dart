import 'dart:convert';
import '../../domain/entities/entity.dart';

VerificaPlazoRenovacionResponseModel verificaPlazoRenovacionResponseFromJson(
  String str,
) => VerificaPlazoRenovacionResponseModel.fromJson(json.decode(str));

class VerificaPlazoRenovacionResponseModel
    extends VerificaPlazoRenovacionResponseEntity {
  VerificaPlazoRenovacionResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory VerificaPlazoRenovacionResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => VerificaPlazoRenovacionResponseModel(
    data: VerificaPlazoRenovacionModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class VerificaPlazoRenovacionModel extends VerificaPlazoRenovacionEntity {
  VerificaPlazoRenovacionModel({
    required super.idDpfOffice,
    required super.termInDays,
  });

  factory VerificaPlazoRenovacionModel.fromJson(Map<String, dynamic> json) =>
      VerificaPlazoRenovacionModel(
        idDpfOffice: json["idDpfOffice"],
        termInDays: json["termInDays"],
      );
}

///VerifyRedeemResponse

VerifyRedeemResponseModel verifyRedeemResponseFromJson(String str) =>
    VerifyRedeemResponseModel.fromJson(json.decode(str));

class VerifyRedeemResponseModel extends VerifyRedeemResponseEntity {
  VerifyRedeemResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory VerifyRedeemResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyRedeemResponseModel(
        data: VerifyRedeemModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class VerifyRedeemModel extends VerifyRedeemEntity {
  VerifyRedeemModel({required super.tipo, required super.info});

  factory VerifyRedeemModel.fromJson(Map<String, dynamic> json) =>
      VerifyRedeemModel(tipo: json["tipo"], info: json["info"]);
}

///ValidateAndSaveRenovationDpfResponse

ValidateAndSaveRenovationDpfResponseModel
validateAndSaveRenovationDpfResponseFromJson(String str) =>
    ValidateAndSaveRenovationDpfResponseModel.fromJson(json.decode(str));

class ValidateAndSaveRenovationDpfResponseModel
    extends ValidateAndSaveRenovationDpfResponseEntity {
  ValidateAndSaveRenovationDpfResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory ValidateAndSaveRenovationDpfResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ValidateAndSaveRenovationDpfResponseModel(
    data: json["data"],
    state: json["state"],
    message: json["message"],
  );
}
