import 'dart:convert';
import '../../domain/entities/entity.dart';

InforAccionesResponseModel inforAccionesResponseFromJson(String str) =>
    InforAccionesResponseModel.fromJson(json.decode(str));

class InforAccionesResponseModel extends InforAccionesResponseEntity {
  InforAccionesResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory InforAccionesResponseModel.fromJson(Map<String, dynamic> json) =>
      InforAccionesResponseModel(
        data: List<InforAccionesModel>.from(
          json["data"].map((x) => InforAccionesModel.fromJson(x)),
        ),
        state: json["state"],
        message: json["message"],
      );
}

class InforAccionesModel extends InforAccionesEntity {
  InforAccionesModel({
    required super.info,
    required super.idTipoOperacion,
    required super.tipo,
    required super.grupo,
    required super.dpfExpiracion,
  });

  factory InforAccionesModel.fromJson(Map<String, dynamic> json) =>
      InforAccionesModel(
        info: json["info"],
        idTipoOperacion: json["idTipoOperacion"],
        tipo: json["tipo"],
        grupo: json["grupo"],
        dpfExpiracion: json["dpfExpiracion"],
      );
}
