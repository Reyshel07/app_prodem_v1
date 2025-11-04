part of 'get_list_location_departments_bloc.dart';

sealed class GetListLocationDepartmentsEvent {}

class GetListLocationDepartmenEvent extends GetListLocationDepartmentsEvent {
  final String idDepartment;
  GetListLocationDepartmenEvent({required this.idDepartment});
}
