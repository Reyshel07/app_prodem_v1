class GetParametersToDigitalDpfResponseentity {
  final GEtParametersToDigitalDpfEntity data;
  final int state;
  final String message;

  GetParametersToDigitalDpfResponseentity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GEtParametersToDigitalDpfEntity {
  final String termAndConditions;
  final List<ColGeographicLocationEntity> colGeographicLocations;
  final List<ColAmountEntity> colAmounts;
  final List<ColRateEntity> colRates;

  GEtParametersToDigitalDpfEntity({
    required this.termAndConditions,
    required this.colGeographicLocations,
    required this.colAmounts,
    required this.colRates,
  });
}

class ColAmountEntity {
  final int idMoney;
  final double minimumAmount;
  final double maximumAmount;

  ColAmountEntity({
    required this.idMoney,
    required this.minimumAmount,
    required this.maximumAmount,
  });
}

class ColGeographicLocationEntity {
  final int idClassifierEntity;
  final String nameClassifierEntity;
  final String classifierCode;
  final bool allowAmount;

  ColGeographicLocationEntity({
    required this.idClassifierEntity,
    required this.nameClassifierEntity,
    required this.classifierCode,
    required this.allowAmount,
  });
}

class ColRateEntity {
  final int idMoney;
  final int minimumTerm;
  final int maximumTerm;
  final double rate;

  ColRateEntity({
    required this.idMoney,
    required this.minimumTerm,
    required this.maximumTerm,
    required this.rate,
  });
}

///GetOfficeListByIdGeographicLocation
class GetOfficeListByIdGeographicLocationEntity {
  final List<GetOfficeListByGeoEntiyt> data;
  final int state;
  final String message;

  GetOfficeListByIdGeographicLocationEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetOfficeListByGeoEntiyt {
  final int idClassifierEntity;
  final String nameClassifierEntity;
  final String classifierCode;
  final bool allowAmount;

  GetOfficeListByGeoEntiyt({
    required this.idClassifierEntity,
    required this.nameClassifierEntity,
    required this.classifierCode,
    required this.allowAmount,
  });
}

///GetDateEstimateResponse
class GetDateEstimateResponseEntity {
  final GetDataEstEntity data;
  final int state;
  final String message;

  GetDateEstimateResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetDataEstEntity {
  final String initialDate;
  final String initialDateMessage;
  final String endDate;
  final String endDateMessage;
  final int term;

  GetDataEstEntity({
    required this.initialDate,
    required this.initialDateMessage,
    required this.endDate,
    required this.endDateMessage,
    required this.term,
  });
}
