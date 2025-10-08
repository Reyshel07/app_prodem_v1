import 'dart:convert';
import '../../domain/entities/entity.dart';

GetReportMovementsByPersonAndDatesResponseModel
getReportMovementsByPersonAndDatesResponseFromJson(String str) =>
    GetReportMovementsByPersonAndDatesResponseModel.fromJson(json.decode(str));

class GetReportMovementsByPersonAndDatesResponseModel
    extends GetReportMovementsByPersonAndDatesResponseEntity {
  GetReportMovementsByPersonAndDatesResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory GetReportMovementsByPersonAndDatesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => GetReportMovementsByPersonAndDatesResponseModel(
    data: GetReportMovementsByPersonAndDateModel.fromJson(json["data"]),
    state: json["state"],
    message: json["message"],
  );
}

class GetReportMovementsByPersonAndDateModel
    extends GetReportMovementsByPersonAndDateEntity {
  GetReportMovementsByPersonAndDateModel({
    //required super.colMovements,
    required super.resultCode,
    required super.errorMessage,
    required super.reportString,
  });

  factory GetReportMovementsByPersonAndDateModel.fromJson(
    Map<String, dynamic> json,
  ) => GetReportMovementsByPersonAndDateModel(
    /*colMovements: List<ColMovementModel>.from(
      json["colMovements"].map((x) => ColMovementModel.fromJson(x)),
    ),*/
    resultCode: json["resultCode"],
    errorMessage: json["errorMessage"],
    reportString: json["reportString"],
  );
}

/*
class ColMovementModel extends ColMovementEntity {
  ColMovementModel({
    required super.idMovement,
    required super.clientName,
    required super.detail,
    required super.amount,
    required super.transactioType,
  });

  factory ColMovementModel.fromJson(Map<String, dynamic> json) =>
      ColMovementModel(
        idMovement: json["idMovement"].toDouble(),
        clientName: clientNameValues.map[json["clientName"]],
        detail: detailValues.map[json["detail"]],
        amount: amountValues.map[json["amount"]],
        transactioType: json["transactioType"],
      );
}
*/
enum Amount { THE_454500_BS, THE_45600_BS }

final amountValues = EnumValues({
  "4545.00 BS": Amount.THE_454500_BS,
  "456.00 BS": Amount.THE_45600_BS,
});

enum ClientName { COBRO_QR, PAGO_QR_HENRY }

final clientNameValues = EnumValues({
  "Cobro QR": ClientName.COBRO_QR,
  "Pago QR - henry": ClientName.PAGO_QR_HENRY,
});

enum Detail { THE_071020250, THE_07102025_DFGSDGSDGGDS, THE_07102025_GASTOS }

final detailValues = EnumValues({
  "07/10/2025 0": Detail.THE_071020250,
  "07/10/2025 dfgsdgsdggds": Detail.THE_07102025_DFGSDGSDGGDS,
  "07/10/2025 gastos": Detail.THE_07102025_GASTOS,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
