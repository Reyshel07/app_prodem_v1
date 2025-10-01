part of 'get_parameters_to_digital_dpf_bloc.dart';

sealed class GetParametersToDigitalDpfState {}

final class GetParametersToDigitalDpfInitial extends GetParametersToDigitalDpfState {}

final class GetParametersToDigitalDpfLoading extends GetParametersToDigitalDpfState {}

final class GetParametersToDigitalDpfError extends GetParametersToDigitalDpfState {
  final String message;
  GetParametersToDigitalDpfError(this.message);
}

final class GetParametersToDigitalDpfSuccess extends GetParametersToDigitalDpfState {
  GetParametersToDigitalDpfResponseentity getParametersToDigitalDpfResponseentity;
  GetParametersToDigitalDpfSuccess(this.getParametersToDigitalDpfResponseentity);
}