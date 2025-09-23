part of 'get_pr_key_by_id_bloc.dart';

sealed class GetPrKeyByIdState {}

final class GetPrKeyByIdInitial extends GetPrKeyByIdState {}

final class GetPrKeyByIdLoading extends GetPrKeyByIdState {}

final class GetPrKeyByIdError extends GetPrKeyByIdState {
  final String message;
  GetPrKeyByIdError(this.message);
}

final class GetPrKeyByIdSuccess extends GetPrKeyByIdState {
  GetProdemKeyByIdResponseEntity? getProdemKeyByIdResponseEntity;
  GetPrKeyByIdSuccess(this.getProdemKeyByIdResponseEntity);
}
