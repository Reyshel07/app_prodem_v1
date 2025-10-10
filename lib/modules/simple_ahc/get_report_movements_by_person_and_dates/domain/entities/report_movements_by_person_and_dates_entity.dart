class GetReportMovementsByPersonAndDatesResponseEntity {
  final GetReportMovementsByPersonAndDateEntity data;
  final int state;
  final String message;

  GetReportMovementsByPersonAndDatesResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetReportMovementsByPersonAndDateEntity {
  final List<ColMovementEntity> colMovements;
  final int resultCode;
  final String errorMessage;
  final String reportString;

  GetReportMovementsByPersonAndDateEntity({
    required this.colMovements,
    required this.resultCode,
    required this.errorMessage,
    required this.reportString,
  });
}

class ColMovementEntity {
  final int idMovement;
  final String clientName;
  final String detail;
  final String amount;
  final int transactioType;

  ColMovementEntity({
    required this.idMovement,
    required this.clientName,
    required this.detail,
    required this.amount,
    required this.transactioType,
  });
}
/*
enum Amount { THE_454500_BS, THE_45600_BS }

final amountValues = EnumValues({
  "4545.00 BS": Amount.THE_454500_BS,
  "456.00 BS": Amount.THE_45600_BS,
});

enum ClientName { COBRO_QR }

final clientNameValues = EnumValues({"Cobro QR": ClientName.COBRO_QR});

enum Detail { THE_071020250, THE_07102025_DFGSDGSDGGDS }

final detailValues = EnumValues({
  "07/10/2025 0": Detail.THE_071020250,
  "07/10/2025 dfgsdgsdggds": Detail.THE_07102025_DFGSDGSDGGDS,
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
*/