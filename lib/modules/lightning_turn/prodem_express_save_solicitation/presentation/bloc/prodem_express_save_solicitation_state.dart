part of 'prodem_express_save_solicitation_bloc.dart';

sealed class ProdemExpressSaveSolicitationState {}

final class ProdemExpressSaveSolicitationInitial
    extends ProdemExpressSaveSolicitationState {}

final class ProdemExpressSaveSolicitationLoading
    extends ProdemExpressSaveSolicitationState {}

final class ProdemExpressSaveSolicitationError
    extends ProdemExpressSaveSolicitationState {
  final String message;
  ProdemExpressSaveSolicitationError(this.message);
}

final class ProdemExpressSaveSolicitationSuccess
    extends ProdemExpressSaveSolicitationState {
  ProdemExpressSaveSolicitationEntity prodemExpressSaveSolicitationEntity;
  ProdemExpressSaveSolicitationSuccess(
    this.prodemExpressSaveSolicitationEntity,
  );
}
