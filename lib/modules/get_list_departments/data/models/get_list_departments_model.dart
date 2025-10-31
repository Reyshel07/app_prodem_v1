import 'dart:convert';
import '../../domain/entities/entity.dart';

GetListDepartmentsResponseModel getListDepartmentsResponseFromJson(
  String str,
) => GetListDepartmentsResponseModel.fromJson(json.decode(str));

class GetListDepartmentsResponseModel extends GetListDepartmentsResponseEntity {
  GetListDepartmentsResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetListDepartmentsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetListDepartmentsResponseModel(
        data: List<GetListDepartmentsModel>.from(
          json["data"].map((x) => GetListDepartmentsModel.fromJson(x)),
        ),
        state: json["state"],
        message: json["message"],
      );
}

class GetListDepartmentsModel extends GetListDepartmentsEntity {
  GetListDepartmentsModel({
    required super.idClassifierEntity,
    required super.nameClassifierEntity,
    required super.allowAmount,
    required super.classifierCode,
  });

  factory GetListDepartmentsModel.fromJson(Map<String, dynamic> json) =>
      GetListDepartmentsModel(
        idClassifierEntity: json["idClassifierEntity"],
        nameClassifierEntity: json["nameClassifierEntity"],
        allowAmount: json["allowAmount"],
        classifierCode: json["classifierCode"],
      );
}

///GetListLocationDepartments
GetListLocationDepartmentsResponseModel
getListLocationDepartmentsResponseFromJson(String str) =>
    GetListLocationDepartmentsResponseModel.fromJson(json.decode(str));

class GetListLocationDepartmentsResponseModel
    extends GetListLocationDepartmentsResponseEntity {
  GetListLocationDepartmentsResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetListLocationDepartmentsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetListLocationDepartmentsResponseModel(
    data: List<GetListLocationDepartmentsModel>.from(
      json["data"].map((x) => GetListLocationDepartmentsModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class GetListLocationDepartmentsModel extends GetListLocationDepartmentsEntity {
  GetListLocationDepartmentsModel({
    required super.idClassifierEntity,
    required super.nameClassifierEntity,
    required super.allowAmount,
    required super.classifierCode,
  });

  factory GetListLocationDepartmentsModel.fromJson(Map<String, dynamic> json) =>
      GetListLocationDepartmentsModel(
        idClassifierEntity: json["idClassifierEntity"],
        nameClassifierEntity: json["nameClassifierEntity"],
        allowAmount: json["allowAmount"],
        classifierCode: json["classifierCode"],
      );
}
