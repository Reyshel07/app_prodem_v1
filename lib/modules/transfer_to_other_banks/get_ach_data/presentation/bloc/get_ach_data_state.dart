part of 'get_ach_data_bloc.dart';

sealed class GetAchDataState {}

final class GetAchDataInitial extends GetAchDataState {}

final class GetAchDataLoading extends GetAchDataState {}

final class GetAchDataError extends GetAchDataState {
  final String message;
  GetAchDataError(this.message);
}

final class GetAchDataSuccess extends GetAchDataState {
  final GetAchDataResponseEntity getAchDataResponseEntity;
  GetAchDataSuccess(this.getAchDataResponseEntity);
}
