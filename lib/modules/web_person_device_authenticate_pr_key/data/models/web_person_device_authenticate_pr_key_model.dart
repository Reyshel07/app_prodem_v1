import 'dart:convert';
import '../../domain/entities/entity.dart';

WebPersonDeviceAuthenticateProdemKeyResponseModel
webPersonDeviceAuthenticateProdemKeyResponseFromJson(String str) =>
    WebPersonDeviceAuthenticateProdemKeyResponseModel.fromJson(
      json.decode(str),
    );

class WebPersonDeviceAuthenticateProdemKeyResponseModel
    extends WebPersonDeviceAuthenticateProdemKeyResponseEntity {
  WebPersonDeviceAuthenticateProdemKeyResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory WebPersonDeviceAuthenticateProdemKeyResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => WebPersonDeviceAuthenticateProdemKeyResponseModel(
    data: json["data"].toDouble(),
    state: json["state"],
    message: json["message"],
  );
}
