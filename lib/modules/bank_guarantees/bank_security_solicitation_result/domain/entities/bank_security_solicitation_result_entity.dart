class BankSecuritySolicitationResultResponseEntity {
  final BankSecuritySolicitationResultEntity data;
  final int state;
  final String message;

  BankSecuritySolicitationResultResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class BankSecuritySolicitationResultEntity {
  final String codigoSolicitud;
  final String moneda;
  final int montoSolicitado;
  final String tipoFianza;
  final String objetoEspecifico;
  final String validesDesdeHasta;
  final String beneficiario;
  final String solicitante;
  final String documentoOrdenante;
  final double comisionFianzaBancaria;

  BankSecuritySolicitationResultEntity({
    required this.codigoSolicitud,
    required this.moneda,
    required this.montoSolicitado,
    required this.tipoFianza,
    required this.objetoEspecifico,
    required this.validesDesdeHasta,
    required this.beneficiario,
    required this.solicitante,
    required this.documentoOrdenante,
    required this.comisionFianzaBancaria,
  });
}
