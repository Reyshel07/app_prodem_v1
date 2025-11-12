class ChargeReferencesResponseEntity {
  final ChargeReferencesEntity data;
  final int state;
  final String message;

  ChargeReferencesResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class ChargeReferencesEntity {
  final List<ColEntity> colTypes;
  final List<ColEntity> colMoneys;
  final List<ColReferenceEntity> colReferences;

  ChargeReferencesEntity({
    required this.colTypes,
    required this.colMoneys,
    required this.colReferences,
  });
}

class ColEntity {
  final int idClasificador;
  final String nombre;
  final String codigo;

  ColEntity({
    required this.idClasificador,
    required this.nombre,
    required this.codigo,
  });
}

class ColReferenceEntity {
  final int idWebReferences;
  final String fullName;
  final String identityCardNumber;
  final int cellPhoneNumber;
  final String kinship;
  final int idcProduct;
  final String productName;
  final int idMoney;
  final String shortName;
  final double ammount;
  final double idWebPersonClientRegister;
  final DateTime processDate;

  ColReferenceEntity({
    required this.idWebReferences,
    required this.fullName,
    required this.identityCardNumber,
    required this.cellPhoneNumber,
    required this.kinship,
    required this.idcProduct,
    required this.productName,
    required this.idMoney,
    required this.shortName,
    required this.ammount,
    required this.idWebPersonClientRegister,
    required this.processDate,
  });
}
