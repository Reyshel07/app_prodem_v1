part of 'get_current_qr_by_type_bloc.dart';

sealed class GetCurrentQrByTypeState {}

final class GetCurrentQrByTypeInitial extends GetCurrentQrByTypeState {}

final class GetCurrentQrByTypeLoading extends GetCurrentQrByTypeState {}

final class GetCurrentQrByTypeError extends GetCurrentQrByTypeState {
  final String message;
  GetCurrentQrByTypeError(this.message);
}

final class GetCurrentQrByTypeSuccess extends GetCurrentQrByTypeState {
  GetCurrentQrByTypeResponseEntity getCurrentQrByTypeResponseEntity;
  GetCurrentQrByTypeSuccess(this.getCurrentQrByTypeResponseEntity);
}
