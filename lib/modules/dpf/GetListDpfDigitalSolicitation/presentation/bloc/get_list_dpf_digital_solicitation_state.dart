part of 'get_list_dpf_digital_solicitation_bloc.dart';

sealed class GetListDpfDigitalSolicitationState {}

final class GetListDpfDigitalSolicitationInitial
    extends GetListDpfDigitalSolicitationState {}

final class GetListDpfDigitalSolicitationLoading
    extends GetListDpfDigitalSolicitationState {}

final class GetListDpfDigitalSolicitationError
    extends GetListDpfDigitalSolicitationState {
  final String message;
  GetListDpfDigitalSolicitationError(this.message);
}

final class GetListDpfDigitalSolicitationSuccess
    extends GetListDpfDigitalSolicitationState {
  GetListDpfDigitalSolicitationResponseEntity
  getListDpfDigitalSolicitationResponseEntity;
  GetListDpfDigitalSolicitationSuccess(
    this.getListDpfDigitalSolicitationResponseEntity,
  );
}
