class GetPafDataForMobileAppResponseEntity {
  final List<GetPafDataForMobileAppEntity> data;
  final int state;
  final String message;

  GetPafDataForMobileAppResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetPafDataForMobileAppEntity {
  final String namePaf;
  final String addressPaf;
  final String telephone;
  final String fax;
  final int idSchedule;
  final double longitude;
  final double latitude;
  final int idcTypePaf;
  final String typePaf;
  final List<String> colSchedule;
  final int idPaf;

  GetPafDataForMobileAppEntity({
    required this.namePaf,
    required this.addressPaf,
    required this.telephone,
    required this.fax,
    required this.idSchedule,
    required this.longitude,
    required this.latitude,
    required this.idcTypePaf,
    required this.typePaf,
    required this.colSchedule,
    required this.idPaf,
  });
}
