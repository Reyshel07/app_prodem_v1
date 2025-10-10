import 'dart:convert';
import '../../domain/entities/entity.dart';

GetCurrentQrByTypeResponseModel getCurrentQrByTypeResponseFromJson(
  String str,
) => GetCurrentQrByTypeResponseModel.fromJson(json.decode(str));

class GetCurrentQrByTypeResponseModel extends GetCurrentQrByTypeResponseEntity {
  GetCurrentQrByTypeResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetCurrentQrByTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCurrentQrByTypeResponseModel(
        data: GetCurrentQrByTypeModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class GetCurrentQrByTypeModel extends GetCurrentQrByTypeEntity {
  GetCurrentQrByTypeModel({
    required super.qr,
    required super.mensajeQr,
    required super.idQr,
  });

  factory GetCurrentQrByTypeModel.fromJson(Map<String, dynamic> json) =>
      GetCurrentQrByTypeModel(
        qr: json["qr"],
        mensajeQr: json["mensajeQR"],
        idQr: json["idQR"],
      );
}
