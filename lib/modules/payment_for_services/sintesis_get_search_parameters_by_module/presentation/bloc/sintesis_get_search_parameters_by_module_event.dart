part of 'sintesis_get_search_parameters_by_module_bloc.dart';

sealed class SintesisGetSearchParametersByModuleEvent {}

class SintesisGetSearchParametersByMoEvent
    extends SintesisGetSearchParametersByModuleEvent {
  final String externalModule;
  final String? name;
  final String? description;
  SintesisGetSearchParametersByMoEvent({
    required this.externalModule,
    required this.name,
    required this.description,
  });
}
