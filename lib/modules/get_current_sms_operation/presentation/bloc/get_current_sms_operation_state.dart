part of 'get_current_sms_operation_bloc.dart';

sealed class GetCurrentSmsOperationState {}

final class GetCurrentSmsOperationInitial extends GetCurrentSmsOperationState {}

final class GetCurrentSmsOperationLoading extends GetCurrentSmsOperationState {}

final class GetCurrentSmsOperationError extends GetCurrentSmsOperationState {
  final String message;
  GetCurrentSmsOperationError(this.message);
}

final class GetCurrentSmsOperationSuccess extends GetCurrentSmsOperationState {
  GetCurrentSmsOperationResponseEntity getCurrentSmsOperationResponseEntity;
  GetCurrentSmsOperationSuccess(this.getCurrentSmsOperationResponseEntity);
}
