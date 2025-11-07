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
