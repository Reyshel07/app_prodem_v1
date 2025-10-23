class InitialChargeBankGuaranteeResponseEntity {
  final InitialChargeBankGuaranteeEntity data;
  final int state;
  final String message;

  InitialChargeBankGuaranteeResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class InitialChargeBankGuaranteeEntity {
  final List<ColBEntity> colBankGuaranteeType;
  final List<ColBEntity> colBeneficiary;
  final List<ColBEntity> colBankGuarantee;

  InitialChargeBankGuaranteeEntity({
    required this.colBankGuaranteeType,
    required this.colBeneficiary,
    required this.colBankGuarantee,
  });
}

class ColBEntity {
  final int idClasificador;
  final String nombre;
  final String codigo;

  ColBEntity({
    required this.idClasificador,
    required this.nombre,
    required this.codigo,
  });
}
