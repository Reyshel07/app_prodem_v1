part of 'get_office_list_by_id_geo_bloc.dart';

sealed class GetOfficeListByIdGeograEvent {}

/// Evento que trae la lista de agencias según el departamento
class GetOfficeListByIdGeoEvent extends GetOfficeListByIdGeograEvent {
  final int idGeo;
  GetOfficeListByIdGeoEvent({required this.idGeo});
}
