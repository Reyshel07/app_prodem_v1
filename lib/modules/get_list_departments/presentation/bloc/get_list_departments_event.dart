part of 'get_list_departments_bloc.dart';

sealed class GetListDepartmentsEvent {}

class GetListDepaEvent extends GetListDepartmentsEvent {
  GetListDepaEvent();
}

class GetListLocationDepartmentsEvent extends GetListDepartmentsEvent {
  final String idDepartment;
  GetListLocationDepartmentsEvent({required this.idDepartment});
}
