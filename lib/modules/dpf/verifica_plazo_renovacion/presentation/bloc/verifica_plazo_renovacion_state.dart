part of 'verifica_plazo_renovacion_bloc.dart';

sealed class VerificaPlazoRenovacionState {}

final class VerificaPlazoRenovacionInitial
    extends VerificaPlazoRenovacionState {}

final class VerificaPlazoRenovacionLoading
    extends VerificaPlazoRenovacionState {}

final class VerificaPlazoRenovacionError extends VerificaPlazoRenovacionState {
  final String message;
  VerificaPlazoRenovacionError(this.message);
}

final class VerificaPlazoRenovacionSuccess
    extends VerificaPlazoRenovacionState {
  final VerificaPlazoRenovacionEntity data;

  VerificaPlazoRenovacionSuccess(this.data);
}
