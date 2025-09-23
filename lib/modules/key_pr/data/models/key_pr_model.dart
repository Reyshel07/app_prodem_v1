import 'dart:convert';
import '../../domain/entities/entity.dart';

CreateProdemKeyResponseModel createProdemKeyResponseFromJson(String str) =>
    CreateProdemKeyResponseModel.fromJson(json.decode(str));
GetProdemKeyByIdResponseModel getProdemKeyByIdResponseFromJson(String str) =>
    GetProdemKeyByIdResponseModel.fromJson(json.decode(str));

class CreateProdemKeyResponseModel extends CreateProdemKeyResponseEntity {
  CreateProdemKeyResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory CreateProdemKeyResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateProdemKeyResponseModel(
        data: json["data"],
        state: json["state"],
        message: json["message"],
      );
}

class GetProdemKeyByIdResponseModel extends GetProdemKeyByIdResponseEntity {
  GetProdemKeyByIdResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetProdemKeyByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GetProdemKeyByIdResponseModel(
        data: json["data"],
        state: json["state"],
        message: json["message"],
      );
}
