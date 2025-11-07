part of 'verifica_plazo_renovacion_bloc.dart';

sealed class VerificaPlazoRenovacionEvent {}

class VerificaPlazoRenoEvent extends VerificaPlazoRenovacionEvent {
  final String idDpfOffice;
  final String termInDays;

  VerificaPlazoRenoEvent({required this.idDpfOffice, required this.termInDays});
}
