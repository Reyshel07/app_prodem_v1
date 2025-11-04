part of 'get_list_departments_bloc.dart';

sealed class GetListDepartmentsState {}

final class GetListDepartmentsInitial extends GetListDepartmentsState {}

final class GetListDepartmentsLoading extends GetListDepartmentsState {}

final class GetListDepartmentsError extends GetListDepartmentsState {
  final String message;
  GetListDepartmentsError(this.message);
}

final class GetListDepartmentsSuccess extends GetListDepartmentsState {
  GetListDepartmentsResponseEntity getListDepartmentsResponseEntity;
  GetListDepartmentsSuccess(this.getListDepartmentsResponseEntity);
}
