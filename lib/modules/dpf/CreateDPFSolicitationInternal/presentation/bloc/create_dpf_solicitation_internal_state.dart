part of 'create_dpf_solicitation_internal_bloc.dart';

sealed class CreateDpfSolicitationInternalState {}

final class CreateDpfSolicitationInternalInitial extends CreateDpfSolicitationInternalState {}



final class CreateDpfSolicitationInternalLoading extends CreateDpfSolicitationInternalState {}

final class CreateDpfSolicitationInternalError extends CreateDpfSolicitationInternalState {
  final String message;
  CreateDpfSolicitationInternalError(this.message);
}

/// Status when obtaining the list of offices by idGeo
final class CreateDpfSolicitationInternalSuccess extends CreateDpfSolicitationInternalState {
  final CreateDpfSolicitationInternalEntity createDpfSolicitationInternalEntity;
  CreateDpfSolicitationInternalSuccess(this.createDpfSolicitationInternalEntity);
}
