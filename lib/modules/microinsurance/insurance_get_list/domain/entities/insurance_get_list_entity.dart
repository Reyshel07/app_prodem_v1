class InsuranceGetListResponseEntity {
  final List<InsuranceGetListEntity> data;
  final int state;
  final String message;

  InsuranceGetListResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class InsuranceGetListEntity {
  final int idInsuranceAnnuity;
  final String monedaTransaccion;
  final String nroCertificado;
  final double montoTransaccion;
  final String asegurado;
  final String beneficiarios;

  InsuranceGetListEntity({
    required this.idInsuranceAnnuity,
    required this.monedaTransaccion,
    required this.nroCertificado,
    required this.montoTransaccion,
    required this.asegurado,
    required this.beneficiarios,
  });
}
