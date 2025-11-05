import 'dart:convert';
import '../../domain/entities/entity.dart';

GetPafDataForMobileAppResponseModel getPafDataForMobileAppResponseFromJson(
  String str,
) => GetPafDataForMobileAppResponseModel.fromJson(json.decode(str));

class GetPafDataForMobileAppResponseModel
    extends GetPafDataForMobileAppResponseEntity {
  GetPafDataForMobileAppResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetPafDataForMobileAppResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetPafDataForMobileAppResponseModel(
    data: List<GetPafDataForMobileAppModel>.from(
      json["data"].map((x) => GetPafDataForMobileAppModel.fromJson(x)),
    ),
    state: json["state"],
    message: json["message"],
  );
}

class GetPafDataForMobileAppModel extends GetPafDataForMobileAppEntity {
  GetPafDataForMobileAppModel({
    required super.namePaf,
    required super.addressPaf,
    required super.telephone,
    required super.fax,
    required super.idSchedule,
    required super.longitude,
    required super.latitude,
    required super.idcTypePaf,
    required super.typePaf,
    required super.colSchedule,
    required super.idPaf,
  });

  factory GetPafDataForMobileAppModel.fromJson(Map<String, dynamic> json) =>
      GetPafDataForMobileAppModel(
        namePaf: json["namePAF"],
        addressPaf: json["addressPAF"],
        telephone: json["telephone"],
        fax: json["fax"],
        idSchedule: json["idSchedule"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
        idcTypePaf: json["idcTypePAF"],
        typePaf: json["typePAF"],
        colSchedule: List<String>.from(json["colSchedule"].map((x) => x)),
        idPaf: json["idPAF"],
      );
}
