part of 'bank_security_solicitation_result_bloc.dart';

sealed class BankSecuritySolicitationResultEvent {}

class BankSecuritySolicitationResEvent
    extends BankSecuritySolicitationResultEvent {
  final String activocirculante;
  final String activofijo;
  final String beneficiario;
  final String codeSavingsAccountOrigin;
  final String costodeVentas;
  final String cUCE;
  final String fechaInicioString;
  final String gastosfamiliares;
  final String gastosOperativos;
  final String idBankGuaranteeClass;
  final String idBankGuaranteeProduct;
  final String idMoneda;
  final String idMonedaCuenta;
  final String idOfficeTarget;
  final String idSavingAccount;
  final String identityCardNumber;
  final String moneda;
  final String monedaCuenta;
  final String montoSolicitado;
  final String nroEmpleados;
  final String objetoBoleta;
  final String otrosactivos;
  final String otrosIngresos;
  final String pagopasivos;
  final String pasivos;
  final String personName;
  final String plazo;
  final String proposito;
  final String tipoBoleta;
  final String ventasMensualesBrutas;
  final String codeOffice;
  final String officeName;
  final String siregarName;
  final String departamento;
  final String idClasificador;
  final String code;
  final String nombre;
  final String? idSMSOperation;
  final String? prodemKeyCode;
  BankSecuritySolicitationResEvent({
    required this.activocirculante,
    required this.activofijo,
    required this.beneficiario,
    required this.cUCE,
    required this.code,
    required this.codeOffice,
    required this.codeSavingsAccountOrigin,
    required this.costodeVentas,
    required this.departamento,
    required this.fechaInicioString,
    required this.gastosOperativos,
    required this.gastosfamiliares,
    required this.idBankGuaranteeClass,
    required this.idBankGuaranteeProduct,
    required this.idClasificador,
    required this.idMoneda,
    required this.idMonedaCuenta,
    required this.idOfficeTarget,
    required this.idSMSOperation,
    required this.idSavingAccount,
    required this.identityCardNumber,
    required this.moneda,
    required this.monedaCuenta,
    required this.montoSolicitado,
    required this.nombre,
    required this.nroEmpleados,
    required this.objetoBoleta,
    required this.officeName,
    required this.otrosIngresos,
    required this.otrosactivos,
    required this.pagopasivos,
    required this.pasivos,
    required this.personName,
    required this.plazo,
    required this.prodemKeyCode,
    required this.proposito,
    required this.siregarName,
    required this.tipoBoleta,
    required this.ventasMensualesBrutas,
  });
}
