part of 'get_parameters_to_digital_dpf_bloc.dart';

sealed class GetParametersToDigitalDpfState {}

final class GetParametersToDigitalDpfInitial
    extends GetParametersToDigitalDpfState {}

final class GetParametersToDigitalDpfLoading
    extends GetParametersToDigitalDpfState {}

final class GetParametersToDigitalDpfError
    extends GetParametersToDigitalDpfState {
  final String message;
  GetParametersToDigitalDpfError(this.message);
}

/// Status when the initial list of parameters is obtained
final class GetParametersToDigitalDpfSuccess
    extends GetParametersToDigitalDpfState {
  final GetParametersToDigitalDpfResponseentity response;
  GetParametersToDigitalDpfSuccess(this.response);
}

/// Status when obtaining the list of offices by idGeo
final class GetOfficeListByIdGeoSuccess extends GetParametersToDigitalDpfState {
  final List<GetOfficeListByGeoEntiyt> offices;
  GetOfficeListByIdGeoSuccess(this.offices);
}
