part of 'check_ownership_edv_bloc.dart';

sealed class CheckOwnershipEdvState {}

final class CheckOwnershipEdvInitial extends CheckOwnershipEdvState {}

final class CheckOwnershipEdvIniLoading extends CheckOwnershipEdvState {}

final class CheckOwnershipEdvIninrror extends CheckOwnershipEdvState {
  final String message;
  CheckOwnershipEdvIninrror(this.message);
}

final class CheckOwnershipEdvSuccess extends CheckOwnershipEdvState {
  final bool data;
  final String codDpfExpidado;
  final String capital;
  final String interes;
  final String impuestoDeCierre;
  final String montoTotalCierre;
  final String plazo;
  final String fechaVencimiento;
  final String tasa;
  CheckOwnershipEdvSuccess(
    this.data,
    this.capital,
    this.codDpfExpidado,
    this.interes,
    this.impuestoDeCierre,
    this.montoTotalCierre,
    this.plazo,
    this.fechaVencimiento,
    this.tasa,
  );
}
