part of 'get_valid_account_bloc.dart';

sealed class GetValidAccountState {}

final class GetValidAccountInitial extends GetValidAccountState {}

final class GetValidAccountLoading extends GetValidAccountState {}

final class GetValidAccountError extends GetValidAccountState {
  final String message;
  GetValidAccountError(this.message);
}

final class GetValidAccountSuccess extends GetValidAccountState {
  final GetValidAccountResponseEntity getValidAccountResponseEntity;
  GetValidAccountSuccess(this.getValidAccountResponseEntity);
}
