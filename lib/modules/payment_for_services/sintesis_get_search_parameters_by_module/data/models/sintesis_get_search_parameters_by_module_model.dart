import 'dart:convert';
import '../../domain/entities/entity.dart';

SintesisGetSearchParametersByModuleResponseModel
sintesisGetSearchParametersByModuleResponseFromJson(String str) =>
    SintesisGetSearchParametersByModuleResponseModel.fromJson(json.decode(str));

class SintesisGetSearchParametersByModuleResponseModel
    extends SintesisGetSearchParametersByModuleResponseEntity {
  SintesisGetSearchParametersByModuleResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory SintesisGetSearchParametersByModuleResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => SintesisGetSearchParametersByModuleResponseModel(
    data: List<SintesisGetSearchParametersByModuleModel>.from(
      json["data"].map(
        (x) => SintesisGetSearchParametersByModuleModel.fromJson(x),
      ),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class SintesisGetSearchParametersByModuleModel
    extends SintesisGetSearchParametersByModuleEntity {
  SintesisGetSearchParametersByModuleModel({
    required super.codeModule,
    required super.moduleName,
    required super.colFields,
  });

  factory SintesisGetSearchParametersByModuleModel.fromJson(
    Map<String, dynamic> json,
  ) => SintesisGetSearchParametersByModuleModel(
    codeModule: json["codeModule"],
    moduleName: json["moduleName"],
    colFields: List<ColFieldModel>.from(
      json["colFields"].map((x) => ColFieldModel.fromJson(x)),
    ),
  );
}

class ColFieldModel extends ColFieldEntity {
  ColFieldModel({
    required super.parameterName,
    required super.parameterType,
    required super.colComboData,
  });

  factory ColFieldModel.fromJson(Map<String, dynamic> json) => ColFieldModel(
    parameterName: json["parameterName"],
    parameterType: json["parameterType"],
    colComboData: json["colComboData"] == null
        ? [] // o null, según tu modelo
        : List<ColComboDatumModel>.from(
            (json["colComboData"] as List).map(
              (x) => ColComboDatumModel.fromJson(x),
            ),
          ),
  );
}

class ColComboDatumModel extends ColComboDatumEntity {
  ColComboDatumModel({
    required super.idDataParam,
    required super.dataParamCode,
    required super.paramDescription,
  });

  factory ColComboDatumModel.fromJson(Map<String, dynamic> json) =>
      ColComboDatumModel(
        idDataParam: json["idDataParam"],
        dataParamCode: json["dataParamCode"],
        paramDescription: json["paramDescription"],
      );
}
