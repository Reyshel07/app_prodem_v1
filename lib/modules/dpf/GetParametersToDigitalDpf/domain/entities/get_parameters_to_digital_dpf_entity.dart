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
  final int minimumAmount;
  final int maximumAmount;

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
