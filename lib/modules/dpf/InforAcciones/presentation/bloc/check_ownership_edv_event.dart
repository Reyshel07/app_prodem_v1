part of 'check_ownership_edv_bloc.dart';

sealed class CheckOwnershipEdvEvent {}

class CheckOwnershipEdvEv extends CheckOwnershipEdvEvent {
  final String idFixedAcount;
  final String codDpfExpidado;
  final String capital;
  final String interes;
  final String impuestoDeCierre;
  final String montoTotalCierre;
  final String plazo;
  final String fechaVencimiento;
  final String tasa;
  CheckOwnershipEdvEv({
    required this.idFixedAcount,
    required this.codDpfExpidado,
    required this.capital,
    required this.interes,
    required this.impuestoDeCierre,
    required this.montoTotalCierre,
    required this.plazo,
    required this.fechaVencimiento,
    required this.tasa,
  });
}
