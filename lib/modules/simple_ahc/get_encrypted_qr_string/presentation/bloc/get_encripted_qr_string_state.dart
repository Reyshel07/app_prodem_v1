part of 'get_encripted_qr_string_bloc.dart';

sealed class GetEncriptedQrStringState {}

final class GetEncriptedQrStringInitial extends GetEncriptedQrStringState {}

final class GetEncriptedQrStringLoading extends GetEncriptedQrStringState {}

final class GetEncriptedQrStringError extends GetEncriptedQrStringState {
  final String message;
  GetEncriptedQrStringError(this.message);
}

final class GetEncriptedQrStringSuccess extends GetEncriptedQrStringState {
  GetEncryptedQrStringEntity getEncryptedQrStringEntity;
  GetEncriptedQrStringSuccess(this.getEncryptedQrStringEntity);
}
