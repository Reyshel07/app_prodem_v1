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

final class GetListLocationDepartmentsInitial extends GetListDepartmentsState {}

final class GetListLocationDepartmentsLoading extends GetListDepartmentsState {}

final class GetListLocationDepartmentsError extends GetListDepartmentsState {
  final String message;
  GetListLocationDepartmentsError(this.message);
}

final class GetListLocationDepartmentsSuccess extends GetListDepartmentsState {
  GetListLocationDepartmentsResponseEntity
  getListLocationDepartmentsResponseEntity;
  GetListLocationDepartmentsSuccess(
    this.getListLocationDepartmentsResponseEntity,
  );
}
