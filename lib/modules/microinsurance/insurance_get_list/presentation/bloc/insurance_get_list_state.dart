part of 'insurance_get_list_bloc.dart';

sealed class InsuranceGetListState {}

final class InsuranceGetListInitial extends InsuranceGetListState {}

final class InsuranceGetListLoading extends InsuranceGetListState {}

final class InsuranceGetListError extends InsuranceGetListState {
  final String message;
  InsuranceGetListError(this.message);
}

final class InsuranceGetListSuccess extends InsuranceGetListState {
  InsuranceGetListResponseEntity insuranceGetListResponseEntity;
  InsuranceGetListSuccess(this.insuranceGetListResponseEntity);
}
