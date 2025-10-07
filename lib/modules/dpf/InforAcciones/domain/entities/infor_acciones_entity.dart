class InforAccionesResponseEntity {
  final List<InforAccionesEntity> data;
  final int state;
  final String message;

  InforAccionesResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class InforAccionesEntity {
  final String info;
  final int idTipoOperacion;
  final String tipo;
  final dynamic grupo;
  final List<DpfExpiracionEntity> dpfExpiracion;

  InforAccionesEntity({
    required this.info,
    required this.idTipoOperacion,
    required this.tipo,
    required this.grupo,
    required this.dpfExpiracion,
  });
}

class DpfExpiracionEntity {
  final String idFixedTermDepositAccount;
  final String codigoDpf;
  final double monto;
  final int idMoney;
  final double interes;
  final int impuestoCierre;
  final int impuestoXRenovar;
  final double capitalARenovar;
  final String moneda;
  final String depositProduct;
  final int idDepositProduct;
  final int countIdPerson;
  final String messageCountIdPerson;
  final bool esPignorado;
  final String hashSeguimiento;
  final int idOffice;
  final String oficina;
  final int idDeptoMf;
  final String departamento;
  final String messagePignorado;
  final dynamic dateExpirationtxt;
  final dynamic termTxt;
  final dynamic rateTxt;

  DpfExpiracionEntity({
    required this.idFixedTermDepositAccount,
    required this.codigoDpf,
    required this.monto,
    required this.idMoney,
    required this.interes,
    required this.impuestoCierre,
    required this.impuestoXRenovar,
    required this.capitalARenovar,
    required this.moneda,
    required this.depositProduct,
    required this.idDepositProduct,
    required this.countIdPerson,
    required this.messageCountIdPerson,
    required this.esPignorado,
    required this.hashSeguimiento,
    required this.idOffice,
    required this.oficina,
    required this.idDeptoMf,
    required this.departamento,
    required this.messagePignorado,
    required this.dateExpirationtxt,
    required this.termTxt,
    required this.rateTxt,
  });
}
