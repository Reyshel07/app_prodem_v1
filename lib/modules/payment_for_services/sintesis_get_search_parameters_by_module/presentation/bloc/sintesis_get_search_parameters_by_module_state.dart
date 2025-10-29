part of 'sintesis_get_search_parameters_by_module_bloc.dart';

sealed class SintesisGetSearchParametersByModuleState {}

final class SintesisGetSearchParametersByModuleInitial
    extends SintesisGetSearchParametersByModuleState {}

final class SintesisGetSearchParametersByModuleLoading
    extends SintesisGetSearchParametersByModuleState {}

final class SintesisGetSearchParametersByModuleError
    extends SintesisGetSearchParametersByModuleState {
  final String message;
  SintesisGetSearchParametersByModuleError(this.message);
}

final class SintesisGetSearchParametersByModuleSuccess
    extends SintesisGetSearchParametersByModuleState {
  SintesisGetSearchParametersByModuleResponseEntity
  sintesisGetSearchParametersByModuleResponseEntity;
  final String? name;
  final String? description;
  final String externalModule;
  SintesisGetSearchParametersByModuleSuccess(
    this.sintesisGetSearchParametersByModuleResponseEntity,
    this.name,
    this.description,
    this.externalModule,
  );
}
