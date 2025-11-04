part of 'get_list_location_departments_bloc.dart';

sealed class GetListLocationDepartmentsState {}

final class GetListLocationDepartmentsInitial
    extends GetListLocationDepartmentsState {}

final class GetListLocationDepartmentsLoading
    extends GetListLocationDepartmentsState {}

final class GetListLocationDepartmentsError
    extends GetListLocationDepartmentsState {
  final String message;
  GetListLocationDepartmentsError(this.message);
}

final class GetListLocationDepartmentsSuccess
    extends GetListLocationDepartmentsState {
  GetListLocationDepartmentsResponseEntity
  getListLocationDepartmentsResponseEntity;
  GetListLocationDepartmentsSuccess(
    this.getListLocationDepartmentsResponseEntity,
  );
}
