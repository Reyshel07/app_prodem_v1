import 'dart:convert';
import '../../domain/entities/entity.dart';

GetParametersToDigitalDpfResponseModel
getParametersToDigitalDpfResponseFromJson(String str) =>
    GetParametersToDigitalDpfResponseModel.fromJson(json.decode(str));

class GetParametersToDigitalDpfResponseModel
    extends GetParametersToDigitalDpfResponseentity {
  GetParametersToDigitalDpfResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetParametersToDigitalDpfResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetParametersToDigitalDpfResponseModel(
    data: GEtPArametersToDigitalDpfModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class GEtPArametersToDigitalDpfModel extends GEtParametersToDigitalDpfEntity {
  GEtPArametersToDigitalDpfModel({
    required super.termAndConditions,
    required super.colGeographicLocations,
    required super.colAmounts,
    required super.colRates,
  });

  factory GEtPArametersToDigitalDpfModel.fromJson(Map<String, dynamic> json) =>
      GEtPArametersToDigitalDpfModel(
        termAndConditions: json["termAndConditions"],
        colGeographicLocations: List<ColGeographicLocationModel>.from(
          json["colGeographicLocations"].map(
            (x) => ColGeographicLocationModel.fromJson(x),
          ),
        ),
        colAmounts: List<ColAmountModel>.from(
          json["colAmounts"].map((x) => ColAmountModel.fromJson(x)),
        ),
        colRates: List<ColRateModel>.from(
          json["colRates"].map((x) => ColRateModel.fromJson(x)),
        ),
      );
}

class ColAmountModel extends ColAmountEntity {
  ColAmountModel({
    required super.idMoney,
    required super.minimumAmount,
    required super.maximumAmount,
  });

  factory ColAmountModel.fromJson(Map<String, dynamic> json) => ColAmountModel(
    idMoney: json["idMoney"],
    minimumAmount: json["minimumAmount"],
    maximumAmount: json["maximumAmount"],
  );

  Map<String, dynamic> toJson() => {
    "idMoney": idMoney,
    "minimumAmount": minimumAmount,
    "maximumAmount": maximumAmount,
  };
}

class ColGeographicLocationModel extends ColGeographicLocationEntity {
  ColGeographicLocationModel({
    required super.idClassifierEntity,
    required super.nameClassifierEntity,
    required super.classifierCode,
    required super.allowAmount,
  });

  factory ColGeographicLocationModel.fromJson(Map<String, dynamic> json) =>
      ColGeographicLocationModel(
        idClassifierEntity: json["idClassifierEntity"],
        nameClassifierEntity: json["nameClassifierEntity"],
        classifierCode: json["classifierCode"],
        allowAmount: json["allowAmount"],
      );
}

class ColRateModel extends ColRateEntity {
  ColRateModel({
    required super.idMoney,
    required super.minimumTerm,
    required super.maximumTerm,
    required super.rate,
  });

  factory ColRateModel.fromJson(Map<String, dynamic> json) => ColRateModel(
    idMoney: json["idMoney"],
    minimumTerm: json["minimumTerm"],
    maximumTerm: json["maximumTerm"],
    rate: json["rate"].toDouble(),
  );
}
