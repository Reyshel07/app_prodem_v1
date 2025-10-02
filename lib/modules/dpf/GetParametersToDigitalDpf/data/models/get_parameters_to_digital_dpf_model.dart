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

///GetOfficeListByIdGeographicLocation
GetOfficeListByIdGeographicLocationModel
getOfficeListByIdGeographicLocationFromJson(String str) =>
    GetOfficeListByIdGeographicLocationModel.fromJson(json.decode(str));

class GetOfficeListByIdGeographicLocationModel
    extends GetOfficeListByIdGeographicLocationEntity {
  GetOfficeListByIdGeographicLocationModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetOfficeListByIdGeographicLocationModel.fromJson(
    Map<String, dynamic> json,
  ) => GetOfficeListByIdGeographicLocationModel(
    data: List<GetOfficeListByGeoModel>.from(
      json["data"].map((x) => GetOfficeListByGeoModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class GetOfficeListByGeoModel extends GetOfficeListByGeoEntiyt {
  GetOfficeListByGeoModel({
    required super.idClassifierEntity,
    required super.nameClassifierEntity,
    required super.classifierCode,
    required super.allowAmount,
  });

  factory GetOfficeListByGeoModel.fromJson(Map<String, dynamic> json) =>
      GetOfficeListByGeoModel(
        idClassifierEntity: json["idClassifierEntity"],
        nameClassifierEntity: json["nameClassifierEntity"],
        classifierCode: json["classifierCode"],
        allowAmount: json["allowAmount"],
      );
}

///GetDateEstimateResponse
GetDateEstimateResponseModel getDateEstimateResponseFromJson(String str) =>
    GetDateEstimateResponseModel.fromJson(json.decode(str));

class GetDateEstimateResponseModel extends GetDateEstimateResponseEntity {
  GetDateEstimateResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetDateEstimateResponseModel.fromJson(Map<String, dynamic> json) =>
      GetDateEstimateResponseModel(
        data: GetDataEstModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class GetDataEstModel extends GetDataEstEntity {
  GetDataEstModel({
    required super.initialDate,
    required super.initialDateMessage,
    required super.endDate,
    required super.endDateMessage,
    required super.term,
  });

  factory GetDataEstModel.fromJson(Map<String, dynamic> json) =>
      GetDataEstModel(
        initialDate: json["initialDate"],
        initialDateMessage: json["initialDateMessage"],
        endDate: json["endDate"],
        endDateMessage: json["endDateMessage"],
        term: json["term"],
      );
}
